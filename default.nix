with import <nixpkgs> {};
with import <nixhome> { inherit stdenv; inherit pkgs; };
let
  inHome = path:
    let home = builtins.getEnv "HOME"; in
    home + "/" + path;
in
{
  dotfiles = mkHome {
    user = builtins.getEnv "USER";
    files = {
      ".bcrc" = inHome ".dots/bcrc";
      ".gitconfig" = inHome ".dots/gitconfig";
      # Desktop background
      ".background-image" = inHome ".dots/pulse-demon.png";
      # fish configuration
      ".config/fish/config.fish" = inHome ".dots/config/fish/config.fish";
      ".config/fish/aliases.fish" = inHome ".dots/config/fish/aliases.fish";
      ".config/fish/functions/fish_prompt.fish" = inHome ".dots/config/fish/functions/fish_prompt.fish";
      ".config/fish/functions/fish_right_prompt.fish" = inHome ".dots/config/fish/functions/fish_right_prompt.fish";
      # Stack configuration
      ".stack/config.yaml" = inHome ".dots/stack/config.yaml";
      ".stack/shell.nix" = inHome ".dots/stack/shell.nix";
      # Per-user Nix configuration
      ".nixpkgs/config.nix" = inHome ".dots/nixpkgs/config.nix";
      # Liferea configuration
      ".config/liferea/accels" = inHome ".dots/config/liferea/accels";
      ".config/liferea/cookies.txt" = inHome ".dots/config/liferea/cookies.txt";
      ".config/liferea/feedlist.opml" = inHome ".dots/config/liferea/feedlist.opml";
      ".config/liferea/feedlist.opml.backup" = inHome ".dots/config/liferea/feedlist.opml.backup";
      ".config/liferea/liferea.css" = inHome ".dots/config/liferea/liferea.css";
      ".local/share/liferea/liferea.db" = inHome ".dots/local/share/liferea/liferea.db";
    };
  };
}
