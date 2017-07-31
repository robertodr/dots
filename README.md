# dots

My dotfiles, inspired by [juselius/dotfiles](https://github.com/juselius/dotfiles), MIT-licensed.
    
    $ git clone https://github.com/robertodr/dots .dots
    $ ln -s .dots/default.nix .
    $ vim default.nix
    $ nix-home

## Structure

- The `config` subdirectory contains files that will be linked into `.config`:
  - `fish` configuration files.
  - `liferea` configuration files.

- The `local` subdirectory contains files that will be linked into `.local`:
  - `liferea` databases.

- The `stack` subdirectory contains the configuration for the Stack Haskell
  toolset. It gets linked into `~/.stack`
