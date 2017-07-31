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
      ".config/fish/functions" = inHome ".dots/config/fish/functions";
      # Stack configuration
      ".stack/config.yaml" = inHome ".dots/stack/config.yaml";
      ".stack/shell.nix" = inHome ".dots/stack/shell.nix";
      # Per-user Nix configuration
      #".nixpkgs" = inHome ".dots/nixpkgs";
      # Liferea configuration
      ".config/liferea" = inHome ".dots/config/liferea";
      ".local/share/liferea" = inHome ".dots/local/share/liferea";
    };
  };
}
