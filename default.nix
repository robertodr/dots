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
      # fish configuration
      ".config/fish/config.fish" = inHome ".dots/fish/config.fish";
      ".config/fish/aliases.fish" = inHome ".dots/fish/aliases.fish";
      ".config/fish/functions" = inHome ".dots/fish/functions";
      # Stack configuration
      ".stack/config.yaml" = inHome ".dots/stack/config.yaml";
      ".stack/shell.nix" = inHome ".dots/stack/shell.nix";
    };
  };
}
