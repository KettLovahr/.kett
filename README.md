# dotkett

This repository houses some of my dotfiles, namely for [Neovim](https://neovim.io/) and [Zsh](https://www.zsh.org/).

The `link.sh` in the root directory will install the dotfiles to their appropriate locations, and if there are files there already, they'll be moved to an `old` directory so they can be restored later. It is a simple script, and can be extended if necessary.

Do note that it is necessary to [install Packer](https://github.com/wbthomason/packer.nvim#quickstart), and then run :PackerInstall or :PackerSync to install the plugins once the configuration files have been linked.

Tool dependencies:
- git
- fzf
- rg (ripgrep)
