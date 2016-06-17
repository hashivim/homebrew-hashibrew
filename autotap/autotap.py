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
        self.stable_version = Version('0.0.0')
        self.devel_version = Version('0.0.0')

    def handle_data(self, data):
        """Look for version strings."""
        if re.search(r'_\d+\.\d+\.\d+$', data):
            this_stable_version = Version(data.split('_')[1])
            if this_stable_version > self.stable_version:
                self.stable_version = this_stable_version
        elif re.search(r'_\d+\.\d+\.\d+-rc\d$', data):
            this_devel_version = Version(data.split('_')[1])
            if this_devel_version > self.devel_version:
                self.devel_version = this_devel_version
        else:
            pass


def product_url(name, version):
    """Get the URL for a product."""
    return 'https://releases.hashicorp.com/%s/%s/%s_%s_darwin_amd64.zip' % (
        name,
        version,
        name,
        version
    )


def shasum_url(name, version):
    """Get the URL for a product's SHA256 sums."""
    return 'https://releases.hashicorp.com/%s/%s/%s_%s_SHA256SUMS' % (
        name,
        version,
        name,
        version
    )


class Formula:
    """A formula for a Hashicorp product."""

    def __init__(self, options):
        """The constructor."""
        self.name = options['name']
        self.desc = options['desc']
        self.homepage = options['homepage']
        self.stable_version = options['stable_version']
        self.devel_version = options['devel_version']

    def path(self):
        """The path to the formula file."""
        return os.path.join(
            os.path.dirname(__file__),
            '..',
            '%s.rb' % self.name
        )

    def stable_sha256(self):
        """The stable SHA256 sum for this formula."""
        f = urlopen(shasum_url(self.name, self.stable_version))
        sha256sums = f.read().decode('utf-8').split('\n')
        line = [l for l in sha256sums if re.search('darwin_amd64', l)][0]
        return line.split()[0]

    def devel_sha256(self):
        """The devel SHA256 sum for this formula."""
        if self.has_devel():
            f = urlopen(shasum_url(self.name, self.devel_version))
            sha256sums = f.read().decode('utf-8').split('\n')
            line = [l for l in sha256sums if re.search('darwin_amd64', l)][0]
            return line.split()[0]
        else:
            pass

    def stable_url(self):
        """The stable URL for this formula."""
        return product_url(self.name, self.stable_version)

    def devel_url(self):
        """The devel URL for this formula."""
        return product_url(self.name, self.devel_version)

    def class_name(self):
        """The Ruby class name for this formula."""
        return "".join(i.title() for i in self.name.split('-'))

    def has_devel(self):
        """Does this formula have a devel version?"""
        return self.devel_version > self.stable_version

    def write(self):
        """Write this formula."""
        env = Environment(
            keep_trailing_newline=True,
            loader=FileSystemLoader('.')
        )
        template = env.get_template('template.txt')
        with open(self.path(), 'w') as f:
            f.write(template.render(product=self))

    def modified(self):
        """Has this formula been modified?"""
        git_status = subprocess.check_output(
            ['git', 'status', '--porcelain', self.path()]
        ).decode('utf-8').split('\n')
        return len([l for l in git_status if l != '']) > 0

    def git_commit(self):
        """Commit the formula to Git."""
        with open(self.path()) as f:
            formula_file = f.read().split('\n')
        vl = [l for l in formula_file if re.match('^(  )?  version', l)]
        version = sorted(vl, reverse=True)[0].split("'")[1]
        subprocess.call([
            'git',
            'commit',
            self.path(),
            '-m'
            '%s %s' % (self.name, version)
        ])


def main():
    """Generate the complete set of formulas."""
    products = ConfigParser()
    products.read(os.path.join(os.path.dirname(__file__), 'products.ini'))
    for product in products.sections():
        url = 'https://releases.hashicorp.com/%s/' % product
        parser = HashicorpReleasesParser()
        f = urlopen(url)
        parser.feed(f.read().decode('utf-8'))
        formula = Formula({
            'desc': products.get(product, 'desc'),
            'homepage': products.get(product, 'homepage'),
            'name': product,
            'stable_version': parser.stable_version,
            'devel_version': parser.devel_version
        })
        formula.write()
        if formula.modified():
            formula.git_commit()


if __name__ == '__main__':
    main()
