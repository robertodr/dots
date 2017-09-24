# dots

My dotfiles, inspired by [juselius/dotfiles](https://github.com/juselius/dotfiles), MIT-licensed.

    $ git clone https://github.com/robertodr/dots .dots
    $ ln -s .dots/default.nix .
    $ vim default.nix
    $ nix-home

## Structure

Notice that the full path to the file is given, so that modifications to the linked
file are correctly propagated to the copy in the repo:

```
".config/fish/functions/fish_right_prompt.fish" = inHome ".dots/config/fish/functions/fish_right_prompt.fish";
```

- The `config` subdirectory contains files that will be linked into `.config`:
  - `fish` configuration files.
  - `liferea` configuration files.
  - `nvim` configuration files.

- The `local` subdirectory contains files that will be linked into `.local`:
  - `liferea` databases.

- The `stack` subdirectory contains the configuration for the Stack Haskell
  toolset. It gets linked into `~/.stack`

## Terminal color schemes

```
wget -O gogh https://git.io/vQgMr; and chmod +x gogh; and ./gogh; and rm gogh
```

## Neovim configuration

The Neovim configuration owes much to the [spf13-vim] Vim distribution.
However, since I am using Neovim and most of the packages in spf13-vim are not useful,
I've simplified and adapted its structure to my needs.

The configuration files are in the `config/nvim/` directory of this repository.
The main file is `init.vim`, which mirrors the contents of `.vimrc`.
As in spf13-vim, there are some tiers of configuration available:[^1]

1. `nvimrc.before` - loaded before configuration
2. `nvimrc.plugins` - plugin configuration
3. `init.vim` - nvim configuration

See `nvimrc.plugins` for specifics on what options can be set to override plugin configuration. See `nvimrc.before` for specifics
on what options can be overridden.

Until I find a way to automatize, these operations have to be run by hand:

1. In some temporary directory, run the following commands to install the [`dein.vim` plugin manager]
```
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh installer.sh ~/.local/share/dein
```
2. Open Neovim and run `:call dein#install()`. The configuration file for Neovim is installed _via_ `nix-home`.

[^1] spf13-vim has additional tiers of configuration, for people maintaining forks of the distribution.

[spf13-vim]: http://vim.spf13.com/
[`dein.vim` plugin manager]: https://github.com/Shougo/dein.vim
