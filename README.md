# Homebrew Xtrkcad Tap

A tap for [xtrkcad](https://sourceforge.net/projects/xtrkcad-fork/), a model railway CAD program.

Also includes some dependencies.

## How do I install it?

Homebrew has some limitations in regard to what dependencies are allowed (a formula can't depend on a cask),
but xtrkcad want these dependencies. Therefore, you need to manually install inkscape before attempting to install
xtrkcad.

```bash
brew install inkscape
brew install recursivetree/xtrkcad/xtrkcad
```

## How to run it
```bash
xtrkcad
```
