Mark's Rogue Homebrew Tap
=========================

    aka ``brew tap aint-nobody-got-time-for-that``

This is my tap for stuff that I want packaged in some way that the
official Homebrew organization doesn't do.

Hashicorp products
------------------

I use several of the Hashicorp products. The current state of installing
and keeping these products up-to-date is pretty disappointing:

-  Hashicorp themselves distribute binaries as simple zip files; there
   are no official OS-native packages.

-  Homebrew requires everything to be built from source, and their
   process for building Go code with dependencies is weird and
   cumbersome, meaning packages for new releases are often delayed.

-  Homebrew Cask packages Hashicorp's official binaries, but Cask's
   facilities for finding out-of-date packages and upgrading them are
   non-existent, which makes this no better than using the binaries
   directly.

What I want is to use the official binaries with the mainstream,
non-Cask Homebrew system. Hence, this tap.

Using This Tap
--------------

First tap the repo.

::

    brew tap markcornick/rogue

Almost all of these formulas (c'mon, "formulae" is silly, we're not
speaking Latin here) conflict with ones in Homebrew mainline, so you'll
need to install them with the ``markcornick/rogue`` prefix, thus:

::

    brew install markcornick/rogue/terraform

Keep in mind that you are intentionally messing with the Homebrew
space-time continuum by using this tap. I cannot and will not be held
responsible for anything that happens.

Maintaining This Tap
--------------------

Maintenance of this tap is entirely automated with the ``autotap.py``
script. Run it to update all formulas and commit modified formulas to
Git.

The list of products for which formulas are generated is in the
``products.ini`` file. To add a new product, simply add a new section to
this file listing its homepage.

``autotap.py`` is possible because the format of
https://releases.hashicorp.com/ is so consistent and predictable. Should
Hashicorp decide to change this in the future, ``autotap.py`` may need
some changes, or may stop working entirely. If you notice this before I
do, please open an issue.

Contributing
------------

Pull requests will be accepted for the following reasons only:

-  to add entirely new Hashicorp products
-  to refactor, correct, or otherwise improve ``autotap.py``

Pull requests that merely update versions of existing products will be
rejected. That's what ``autotap.py`` is for, and I'll run it as neeeded.

``autotap.py`` requires Python 3. Compatibility with Python 2 is not a
goal. Depending only on the Python 3 standard library *is* a goal.

Issues regarding the Hashicorp products should be directed to Hashicorp.
Issues regarding Homebrew should be directed to Homebrew. This tap is
not affiliated with or endorsed by either Hashicorp or Homebrew.
