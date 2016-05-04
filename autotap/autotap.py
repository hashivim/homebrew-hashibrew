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
from semantic_version import Version
from six.moves import configparser
from six.moves import html_parser
from six.moves.urllib.request import urlopen
from string import Template


class HashicorpReleasesParser(html_parser.HTMLParser):
    """Parse a releases.hashicorp.com page."""

    def __init__(self):
        """Initialize the parser."""
        html_parser.HTMLParser.__init__(self)
        self.version = '0.0.0'

    def handle_data(self, data):
        """Look for version strings."""
        if re.search(r'_\d+\.\d+\.\d+$', data):
            this_version = data.split('_')[1]
            if Version(this_version) > Version(self.version):
                self.version = this_version


def formula_path(product):
    """Get the path to a product's formula file."""
    return os.path.join(
        os.path.dirname(__file__),
        '..',
        '%s.rb' % product['name']
    )


def sha256sum(product):
    """Get the SHA256 sum for a product."""
    url = 'https://releases.hashicorp.com/%s/%s/%s_%s_SHA256SUMS' % (
        product['name'],
        product['version'],
        product['name'],
        product['version']
    )
    f = urlopen(url)
    sha256sums = f.read().decode('utf-8').split('\n')
    line = [l for l in sha256sums if re.search('darwin_amd64', l)][0]
    return line.split()[0]


def ruby_classify(product):
    """Convert a product name to a Ruby class name."""
    return "".join(i.title() for i in product['name'].split('-'))


def create_formula(product):
    """Write a formula file."""
    with open(os.path.join(os.path.dirname(__file__), 'template.txt')) as f:
        template = Template(f.read())
    with open(formula_path(product), 'w') as f:
        f.write(template.substitute({
            'desc': product['desc'],
            'homepage': product['homepage'],
            'name': product['name'],
            'ruby_class': ruby_classify(product),
            'sha256sum': sha256sum(product),
            'version': product['version']
        }))


def generate_formulas():
    """Generate the complete set of formulas."""
    products = configparser.ConfigParser()
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
            'version': parser.version
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
        vl = [l for l in formula_file if re.match('^  version', l)][0]
        version = vl.split("'")[1]
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
