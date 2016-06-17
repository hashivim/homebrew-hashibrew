#!/usr/bin/env python
#
# Copyright 2016 Mark Cornick
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Automatically maintain the homebrew-rogue tap."""

import os.path
import re
import subprocess
from ConfigParser import ConfigParser
from HTMLParser import HTMLParser
from jinja2 import Environment, FileSystemLoader
from semantic_version import Version
from urllib2 import urlopen


class HashicorpReleasesParser(HTMLParser):
    """Parse a releases.hashicorp.com page."""

    def __init__(self):
        """Initialize the parser."""
        HTMLParser.__init__(self)
        self.stable_version = '0.0.0'
        self.devel_version = '0.0.0'

    def handle_data(self, data):
        """Look for version strings."""
        if re.search(r'_\d+\.\d+\.\d+$', data):
            this_stable_version = data.split('_')[1]
            if Version(this_stable_version) > Version(self.stable_version):
                self.stable_version = this_stable_version
        elif re.search(r'_\d+\.\d+\.\d+-rc\d$', data):
            this_devel_version = data.split('_')[1]
            if Version(this_devel_version) > Version(self.devel_version):
                self.devel_version = this_devel_version
        else:
            pass


def formula_path(product):
    """Get the path to a product's formula file."""
    return os.path.join(
        os.path.dirname(__file__),
        '..',
        '%s.rb' % product['name']
    )


def sha256(product, devel=False):
    """Get the SHA256 sum for a product."""
    if devel:
        version = product['devel_version']
    else:
        version = product['stable_version']
    url = 'https://releases.hashicorp.com/%s/%s/%s_%s_SHA256SUMS' % (
        product['name'],
        version,
        product['name'],
        version
    )
    f = urlopen(url)
    sha256sums = f.read().decode('utf-8').split('\n')
    line = [l for l in sha256sums if re.search('darwin_amd64', l)][0]
    return line.split()[0]


def url(product, devel=False):
    """Get the URL for a product."""
    if devel:
        version = product['devel_version']
    else:
        version = product['stable_version']
    return 'https://releases.hashicorp.com/%s/%s/%s_%s_darwin_amd64.zip' % (
        product['name'],
        version,
        product['name'],
        version
    )


def class_name(product):
    """Get the Ruby class name for a product."""
    return "".join(i.title() for i in product['name'].split('-'))


def create_formula(product):
    """Write a formula file."""
    product['class_name'] = class_name(product)
    product['stable_sha256'] = sha256(product)
    product['stable_url'] = url(product)
    if Version(product['devel_version']) > Version(product['stable_version']):
        product['devel_sha256'] = sha256(product, True)
        product['devel_url'] = url(product, True)
    else:
        product['devel_version'] = None
    env = Environment(
        keep_trailing_newline=True,
        loader=FileSystemLoader('.')
    )
    template = env.get_template('template.txt')
    with open(formula_path(product), 'w') as f:
        f.write(template.render(product))


def generate_formulas():
    """Generate the complete set of formulas."""
    products = ConfigParser()
    products.read(os.path.join(os.path.dirname(__file__), 'products.ini'))
    for section in products.sections():
        url = 'https://releases.hashicorp.com/%s/' % section
        parser = HashicorpReleasesParser()
        f = urlopen(url)
        parser.feed(f.read().decode('utf-8'))
        create_formula({
            'desc': products.get(section, 'desc'),
            'homepage': products.get(section, 'homepage'),
            'name': section,
            'stable_version': parser.stable_version,
            'devel_version': parser.devel_version
        })


def git_commit():
    """Commit modified formulas to Git."""
    git_status = subprocess.check_output(
        ['git', 'status', '--porcelain']
    ).decode('utf-8').split('\n')
    modified = [l for l in git_status if re.search(r'^ M .*\.rb$', l)]
    for name in [l.split(' M ')[1].replace('.rb', '') for l in modified]:
        formula = {'name': name}
        with open(formula_path(formula)) as f:
            formula_file = f.read().split('\n')
        vl = [l for l in formula_file if re.match('^(  )?  version', l)]
        version = sorted(vl, reverse=True)[0].split("'")[1]
        subprocess.call([
            'git',
            'commit',
            formula_path(formula),
            '-m'
            '%s %s' % (name, version)
        ])


def main():
    """Pull it all together."""
    generate_formulas()
    git_commit()

if __name__ == '__main__':
    main()
