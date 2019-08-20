# dotfiles

Personal configuration files for Arch Linux and macOS

First, [install chezmoi](https://github.com/twpayne/chezmoi/blob/master/docs/INSTALL.md)
Then run the following to install these dotfiles:
```
chezmoi init --apply --verbose https://github.com/louisch/dotfiles.git
```

Then to update dotfiles from remote, use
```
chezmoi update
```

You can also simply download the files without applying then first,
see what changes will occur on apply, and only apply once you are
satisfied with what will happen:
```
chezmoi init https://github.com/louisch/dotfiles.git
chezmoi diff
chezmoi apply
```
