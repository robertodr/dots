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

- The `local` subdirectory contains files that will be linked into `.local`:
  - `liferea` databases.

- The `stack` subdirectory contains the configuration for the Stack Haskell
  toolset. It gets linked into `~/.stack`
