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
        elif re.search(r'_\d+\.\d+\.\d+-rc\d+$', data):
            this_devel_version = Version(data.split('_')[1])
            if this_devel_version > self.devel_version:
                self.devel_version = this_devel_version
        else:
            pass


class Formula:
    """A formula for a Hashicorp product."""

    def __init__(self, params):
        """Construct a formula."""
        self.name = params['name']
        self.desc = params['desc']
        self.homepage = params['homepage']
        self.path = os.path.join(
            os.path.dirname(__file__),
            '..',
            '%s.rb' % self.name
        )
        self.class_name = "".join(i.title() for i in self.name.split('-'))
        parser = HashicorpReleasesParser()
        stream = urlopen('https://releases.hashicorp.com/%s/' % self.name)
        parser.feed(stream.read().decode('utf-8'))
        self.stable_version = parser.stable_version
        self.devel_version = parser.devel_version
        self.stable_url = self.product_url(self.stable_version)
        self.stable_sha256 = self.find_sha256(self.stable_version)
        if self.devel_version > self.stable_version:
            self.devel_url = self.product_url(self.devel_version)
            self.devel_sha256 = self.find_sha256(self.devel_version)
        else:
            self.devel_version = None

    def hashicorp_url(self, version):
        """The hashicorp.com namespace for this formula."""
        return 'https://releases.hashicorp.com/%s/%s' % (
            self.name,
            version
        )

    def product_url(self, version):
        """The URL for this formula."""
        return '%s/%s_%s_darwin_amd64.zip' % (
            self.hashicorp_url(version),
            self.name,
            version
        )

    def shasum_url(self, version):
        """The URL for this formula's SHA256 sums."""
        return '%s/%s_%s_SHA256SUMS' % (
            self.hashicorp_url(version),
            self.name,
            version
        )

    def find_sha256(self, version):
        """Find a SHA256 sum."""
        stream = urlopen(self.shasum_url(version))
        sha256sums = stream.read().decode('utf-8').split('\n')
        line = [l for l in sha256sums if re.search('darwin_amd64', l)][0]
        return line.split()[0]

    def write(self):
        """Write this formula."""
        environment = Environment(
            keep_trailing_newline=True,
            loader=FileSystemLoader('.')
        )
        template = environment.get_template('template.txt')
        with open(self.path, 'w') as formula_file:
            formula_file.write(template.render(product=self))

    def needs_commit(self):
        """Is this formula modified or newly created?"""
        git_status = subprocess.check_output(
            ['git', 'status', '--porcelain', self.path]
        ).decode('utf-8').split('\n')
        new_formula = ['?? %s.rb' % self.name, '']
        if git_status == new_formula:
            subprocess.call(['git', 'add', self.path])
            return True
        else:
            return len(git_status) > 1

    def commit(self):
        """Commit the formula to Git."""
        with open(self.path, 'r') as formula_file:
            contents = formula_file.read().split('\n')
        versions = [l for l in contents if re.match('^\s+version', l)]
        version = sorted(versions, reverse=True)[0].split("'")[1]
        subprocess.call([
            'git',
            'commit',
            self.path,
            '-m'
            '%s %s' % (self.name, version)
        ])
        subprocess.call(['git', 'push', 'origin', 'master'])


def main():
    """Generate the complete set of formulas."""
    products = ConfigParser()
    products.read(os.path.join(os.path.dirname(__file__), 'products.ini'))
    for name in products.sections():
        formula = Formula({
            'desc': products.get(name, 'desc'),
            'homepage': products.get(name, 'homepage'),
            'name': name
        })
        formula.write()
        if formula.needs_commit():
            formula.commit()


if __name__ == '__main__':
    main()
