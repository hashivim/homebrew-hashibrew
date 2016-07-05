# Unofficial Hashicorp Homebrew Tap

_This is an unofficial tap, not affiliated with or endorsed by either
Hashicorp or Homebrew._

This is a tap for Hashicorp's products. The current state of installing
and keeping these products up-to-date is pretty disappointing:

-   Hashicorp themselves distribute binaries as simple zip files; there
    are no official OS-native packages.

-   Homebrew requires everything to be built from source, and their
    process for building Go code with dependencies is weird and
    cumbersome, meaning packages for new releases are often delayed.

-   Homebrew Cask packages Hashicorp's official binaries, but Cask's
    facilities for finding out-of-date packages and upgrading them are
    non-existent, which makes this no better than using the
    binaries directly.

This tap lets you use the official binaries with the core, non-Cask
Homebrew system. It includes all of the core Hashicorp tools (except for
Vagrant, which is distributed as a DMG file) as well as some additional
tools.

## Using This Tap

First tap the repo.

    brew tap hashivim/hashibrew

Almost all of these formulas (c'mon, "formulae" is silly, we're not
speaking Latin here) conflict with ones in Homebrew mainline, so you'll
need to install them with the `hashivim/hashibrew` prefix, thus:

    brew install hashivim/hashibrew/terraform

Hashicorp often releases -rc versions before major updates. When
available, these can be installed thus:

    brew install --devel hashivim/hashibrew/terraform

## Maintaining This Tap

Maintenance of this tap is entirely automated with the `autotap.py`
script. Run it to update all formulas and commit modified formulas to
Git.

The list of products for which formulas are generated is in the
`products.ini` file. To add a new product, simply add a new section to
this file listing its description and homepage.

`autotap.py` is possible because the format of the zip files and of
<https://releases.hashicorp.com/> is so consistent and predictable.
Should Hashicorp decide to change this in the future, `autotap.py` may
need some changes, or may stop working entirely. If you notice this
before the maintainers do, please open an issue.

## Contributing

Pull requests will be accepted for the following reasons only:

-   to add entirely new Hashicorp products
-   to refactor, correct, or otherwise improve `autotap.py`

Pull requests that merely update versions of existing products will be
rejected. That's what `autotap.py` is for, and the maintainers will run
it as needed.

Issues regarding the Hashicorp products should be directed to Hashicorp.
Issues regarding Homebrew should be directed to Homebrew. Remember, this
tap is not affiliated with or endorsed by either Hashicorp or Homebrew.
