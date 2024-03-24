# dotkett

This repository houses some of my dotfiles, namely for [Neovim](https://neovim.io/) and [Zsh](https://www.zsh.org/).

The `link.sh` in the root directory will install the dotfiles to their appropriate locations, and if there are files there already, they'll be moved to an `old` directory so they can be restored later. It is a simple script, and can be extended if necessary.

Do note that it is necessary to [install Packer](https://github.com/wbthomason/packer.nvim#quickstart), and then run :PackerInstall or :PackerSync to install the plugins once the configuration files have been linked.

The Neovim configuration requires Neovim v0.9+, which should be provided by most distros, but Debian and Ubuntu still ship really old versions, incompatible with the configuration present here. Use the [bob](https://github.com/MordechaiHadad/bob) version manager to install an up-to-date Neovim version in these distributions.

Tool dependencies:
- git
- fzf
- rg (ripgrep)
