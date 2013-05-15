# Leaf

_"No commits left behind."_

**NOTE: This is a work in progress, and some of the functionality described
below may not have been implemented. I'd really appreciate feedback of any
variety!**

Leaf is a wrapper for git that keeps track of where your repositories are, then
tells you if you have any changes you forgot to push when you tell it you're
leafing (sorry). It will also warn you if there are any repositories that don't
have remotes set up.

It was built to address a problem in my workflow, so that if I forget to push
any changes from my work machine when I leaf work, I'm not totally screwed when
I get home and can't pull any of the work I did that day. This is like tying a
bow on your finger, except more informative and less damaging to your
circulation.

It has two parts: `leaf` and `leaf-collector`.

## leaf

This is the part that you interact with. When you run

    $ leaf

in your terminal, `leaf` will give you a nice report of things that might need
your attention.

You can use the `-t` option to limit the output to a newline delimited list of
directories that need to be pushed. Useful with `xargs`, perhaps (_not yet
implemented_)?

## leaf-collector

This is the one that wraps git. It just sits there and waits for you to use
`git`, at which point it leaps into action and ferociously logs the current
directory for `leaf` to look at later.

The directories `leaf-collector` logs for you go in the file `~/.leaf-pile`.
You can always manually add or remove directories from the leaf pile if you
want to do so.

## Installation

### leaf

Symlink `leaf` to somewhere in your path. How easy is that?

### leaf-collector

You just need to alias `git` to `leaf-collector`. The way I do this is to
symlink `leaf-collector` into `~/bin`, then set up this alias:

    alias git="~/bin/leaf-collector"

Obviously you'll need to `source ~/.zshrc` or `source ~/.bashrc` or open a new
terminal or something to get it to start working.

## Usage

Once you've set up everything, `leaf-collector` will just do its thing, and you
don't need to worry about it at all. What you do need to worry about is running
`leaf` when you want to see if you have unpushed commits.

## Contributing/Feedback

Help make it better. Send me an email (<hello@mrmikea.com>) or fork and send
pull requests or open an issue or something. You know what to do.
