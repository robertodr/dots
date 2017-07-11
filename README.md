# dots

My dotfiles, inspired by [juselius/dotfiles](https://github.com/juselius/dotfiles), MIT-licensed.
    
    $ git clone https://github.com/robertodr/dots .dots
    $ ln -s .dots/default.nix .
    $ vim default.nix
    $ nix-home

## Structure

- The `fish` subdirectory contains the configuration for the fish shell.  
  It gets linked into `~/.config/fish`

- The `stack` subdirectory contains the configuration for the Stack Haskell
  toolset. It gets linked into `~/.stack`
