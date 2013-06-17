# Leaf

_"No commits left behind."_

Leaf keeps an eye on your git repositories. Before you leave your computer,
type `leaf` in the terminal, and leaf will let you know if there's anything you
might want to look at before you go. It will warn you about:

- Unpushed commits
- Unstaged changes
- Uncommitted changes
- Untracked files
- Repos with no remotes set

It was built to stop me leaving commits stranded on my work computer when I
left the office. It's like tying a bow on your finger, but more informative and
less damaging to your circulation.

It has two parts: `leaf` and `leaf-collector`.

## leaf

This is the part that you interact with. When you run

    $ leaf

in your terminal, `leaf` will give you a nice report of things that might need
your attention.

## leaf-collector

This is the glue that wraps git and makes everything work. It just sits there
and waits for you to use `git`, at which point it leaps into action and
ferociously logs the current directory for `leaf` to look at later. Keep in
mind that if you don't use `git` somewhere inside a repo, `leaf` won't know
that it exists.

_(Part of my zsh prompt runs `git` to check the status of the current repo, so
this happens automatically for me. You might want to think about setting up
something like that if you haven't already.)_

`leaf-collector` logs directories in `~/.leaf-pile`.  You can always manually
add or remove directories from the leaf pile if you want to do so.

## Installation

Clone this repository (you'll want to put it somewhere where it can live
forever, since you don't want to have symlinks that point to nothing if you
ever move the directory).

### leaf

Symlink `leaf` to somewhere in your path (e.g. mine is at `~/bin/leaf`). How
easy is that?

### leaf-collector

You need to alias `git` to `leaf-collector`. The way I do this is to symlink
`leaf-collector` into `~/bin`, then set up this alias:

    alias git="~/bin/leaf-collector"

Obviously you'll need to `source ~/.zshrc` or `source ~/.bashrc` or open a new
terminal or something to get it to start working, but you knew that.

## Usage

Once you've got everything in place, `leaf-collector` will just do its thing,
and you don't need to worry about it at all. All you need to do is run `leaf`
whenever you want to know the status of your repositories.

## Contributing/Feedback

Help make it better! Send me an email (<hello@mrmikea.com>) or open an issue or
fork and send pull requests or something. You know what to do.
