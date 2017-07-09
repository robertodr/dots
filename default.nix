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
      ".bcrc" = inHome ".dots/.bcrc";
      ".gitconfig" = inHome ".dots/.gitconfig";
      ".config/fish/config.fish" = inHome ".dots/config.fish";
      ".config/fish/aliases.fish" = inHome ".dots/aliases.fish";
      ".config/fish/functions" = inHome ".dots/functions";
    };
  };
}
