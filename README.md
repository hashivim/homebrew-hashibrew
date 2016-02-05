# Mark's Rogue Homebrew Tap

> aka `brew tap aint-nobody-got-time-for-that`

This is my tap for stuff that I want packaged in some way that the
official Homebrew organization doesn't do.

## Hashicorp tools

I use several of the Hashicorp tools. The current state of installing
and keeping these tools up-to-date is pretty disappointing:

-   Hashicorp themselves distribute binaries as simple zip files; there
    are no official OS-native packages.

-   Homebrew requires everything to be built from source, and their
    process for building Go code with dependencies is gross and
    cumbersome, meaning packages for new releases are often delayed.

-   Homebrew Cask packages Hashicorp's binaries directly, but Cask's
    facilities for finding out-of-date packages and upgrading them are
    non-existent, which makes this no better than using the binaries
    directly.

What I want is to use the official binaries with the mainstream,
non-Cask Homebrew system. Hence, this tap.

## Using This Tap

All of these formulas (c'mon, "formulae" is silly, we're not speaking
Latin here) conflict with ones in Homebrew mainline, so you'll need to
install them with the `markcornick/rogue` prefix, thus:

    brew tap install markcornick/rogue/terraform

Keep in mind that you are intentionally messing with the Homebrew
space-time continuum by using this tap. I cannot and will not be held
responsible for anything that happens.

## Contributing

Sorry, but please don't. This tap is really just meant to satisfy my
cantankerousness, so let me deal with it. Energy would be better spent
trying to get Homebrew Cask to properly do outdated/upgrade detection,
such as is common in modern package management, or to get Homebrew to
deal with building Go packages in a less painful way. Pull requests will
be ignored. Thanks for understanding.
