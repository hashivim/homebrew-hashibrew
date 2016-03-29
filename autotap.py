#!/usr/bin/env python3

"""Automatically maintain the homebrew-rogue tap."""

import configparser
import html.parser
import re
import string
import subprocess
import urllib.request


class hashicorp_releases_parser(html.parser.HTMLParser):
    """Parse a releases.hashicorp.com page."""

    def __init__(self):
        """Initialize the parser."""
        html.parser.HTMLParser.__init__(self)
        self.in_a = False
        self.in_li = False
        self.product = ''
        self.version = ''
        self.versions = []

    def handle_starttag(self, tag, attrs):
        """Detect opening tags."""
        if tag == "li":
            self.in_li = True
        if tag == "a" and self.in_li:
            self.in_a = True

    def handle_endtag(self, tag):
        """Detect closing tags."""
        if tag == "a":
            self.in_a = False
        if tag == "li":
            self.in_li = False
        if tag == "html":
            self.product, self.version = self.versions[0].split('_')

    def handle_data(self, data):
        """Collect versions found in A tags."""
        if self.in_a:
            if not re.search('\.\.|\-rc.$', data):
                self.versions.append(data)


def sha256sum(product, version):
    """Get the SHA256 sum for a product and version."""
    url = 'https://releases.hashicorp.com/%s/%s/%s_%s_SHA256SUMS' % (
        product, version, product, version
    )
    request = urllib.request.Request(url)
    with urllib.request.urlopen(request) as f:
        sha256sums = f.read().decode('utf-8').split('\n')
    line = [l for l in sha256sums if re.search('darwin_amd64', l)][0]
    return line.split()[0]


def create_formula(product, version, homepage):
    """Write a formula file."""
    with open('template.txt') as f:
        template = string.Template(f.read())
    with open('%s.rb' % product, 'w') as f:
        f.write(template.substitute(
            homepage=homepage,
            product=product,
            ruby_class=ruby_classify(product),
            sha256sum=sha256sum(product, version),
            version=version
        ))


def ruby_classify(product):
    """Convert a product name to a Ruby class name."""
    return "".join(i.title() for i in product.split('-'))


def generate_formulas():
    """Generate the complete set of formulas."""
    products = configparser.ConfigParser()
    products.read('products.cfg')
    for product in products.sections():
        url = 'https://releases.hashicorp.com/%s/' % product
        parser = hashicorp_releases_parser()
        request = urllib.request.Request(url)
        with urllib.request.urlopen(request) as f:
            parser.feed(f.read().decode('utf-8'))
        create_formula(
            parser.product,
            parser.version,
            products[product]['homepage']
        )


def git_commit():
    """Commit modified formulas to Git."""
    git_status = subprocess.run(
            ['git', 'status', '--porcelain'],
            stdout=subprocess.PIPE
        ).stdout.decode('utf-8').split('\n')
    modified = [l for l in git_status if re.search('\.rb$', l)]
    for formula in [l.split(' M ')[1].replace('.rb', '') for l in modified]:
        with open('%s.rb' % formula) as f:
            formula_file = f.read().split('\n')
        vl = [l for l in formula_file if re.match('^  version', l)][0]
        version = vl.split("'")[1]
        subprocess.run([
            'git',
            'commit',
            '%s.rb' % formula,
            '-m'
            '%s %s' % (formula, version)
        ])


def main():
    """Pull it all together."""
    generate_formulas()
    git_commit()

if __name__ == '__main__':
    main()
