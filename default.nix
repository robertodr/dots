with import <nixpkgs> {};
with import <nixhome> { inherit stdenv; inherit pkgs; };
let
  inHome = path:
    let
      home = builtins.getEnv "HOME";
    in
      home + "/" + path;
in
{
  dotfiles = mkHome {
    user = builtins.getEnv "USER";
    files = {
      ".bcrc" = inHome ".dots/bcrc";
      ".gitconfig" = inHome ".dots/gitconfig";
      ".respectrc" = inHome ".dots/respectrc";
      # tmux configuration
      ".tmux.conf" = inHome ".dots/tmux.conf";
      # Desktop background
      ".background-image" = inHome ".dots/pulse-demon.png";
      # Awesome
      ".config/awesome" = inHome ".dots/config/awesome";
      # direnv
      ".config/direnv" = inHome ".dots/config/direnv";
      # fish
      ".config/fish" = inHome ".dots/config/fish";
      # kitty
      ".config/kitty" = inHome ".dots/config/kitty";
      # Neovim
      ".config/nvim" = inHome ".dots/config/nvim";
      # Spacemacs
      ".spacemacs" = inHome ".dots/spacemacs";
      # Stack
      ".stack" = inHome ".dots/stack";
      # Liferea
      ".config/liferea" = inHome ".dots/config/liferea";
      ".local/share/liferea/liferea.db" = inHome ".dots/local/share/liferea/liferea.db";
    };
  };
}
