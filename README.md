# leaf

##### _"No commits left behind."_

Leaf is a wrapper for git that keeps track of where your repositories are, then
tells you if you have any changes you forgot to push when you tell it you're
leafing (sorry). It will also warn you if there are any repositories that don't
have remotes set up.

It was designed to address a problem in my workflow, so that if I forget to
push any changes from my work machine when I leaf work, I'm not totally screwed
when I get home and can't pull any of the work I did that day. This is like
tying a little string on your finger, except more informative, less weird, and
less damaging to your circulation.

It has two parts: `leaf` and `leaf-collector`.

## leaf

This is the part that you interact with. When you run

    $ leaf

in your terminal, `leaf` will give you a nice report of any commits you may have
forgotten to push. If the name `leaf` doesn't jive with you, just rename it,
silly.

You can use the `-t` option to limit the output to a newline delimited list of
directories that need to be pushed. Useful with `xargs`, perhaps?

## leaf-collector

TODO: give instructions for setting up the leaf-collector.

This is the one that wraps git. It just sits there and waits for you to use
`git`, at which point it leaps into action and ferociously logs the current
directory for `leaf` to look at later.

By default, `leaf-collector` will put the directory names in the
`~/.leaf-pile`.  You can change this by putting this line in a file called
`~/.leafrc`:

    leaf-pile = ~/some/other/leaf-pile

## Installation

Install it.

## Usage

Use it.

## Contributing/Feedback

Make it better. Send me an email (<hello@mrmikea.com>) or something.
