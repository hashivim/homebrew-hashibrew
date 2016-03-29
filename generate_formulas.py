#!/usr/bin/env python3

"""Generate homebrew-rogue formulas."""

import html.parser
import re
import string
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
            if not re.search('\.\.|rc', data):
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


def main():
    """Generate the complete set of formulas."""
    products = [
        ('atlas-upload-cli', 'https://github.com/hashicorp/atlas-upload-cli'),
        ('consul', 'https://www.consul.io'),
        ('envconsul', 'https://github.com/hashicorp/envconsul'),
        ('consul-replicate', 'https://github.com/hashicorp/consul-replicate'),
        ('consul-template', 'https://github.com/hashicorp/consul-template'),
        ('nomad', 'https://www.nomadproject.io'),
        ('otto', 'https://www.ottoproject.io'),
        ('packer', 'https://www.packer.io'),
        ('serf', 'https://www.serfdom.io'),
        ('terraform', 'https://www.terraform.io'),
        ('vault', 'https://www.vaultproject.io')
    ]

    for product in products:
        name = product[0]
        homepage = product[1]
        url = 'https://releases.hashicorp.com/%s/' % name
        parser = hashicorp_releases_parser()
        request = urllib.request.Request(url)
        with urllib.request.urlopen(request) as f:
            parser.feed(f.read().decode('utf-8'))
        create_formula(
            parser.product,
            parser.version,
            homepage
        )

if __name__ == '__main__':
    main()
