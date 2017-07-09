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
      ".aliases" = inHome ".dots/.aliases";
      ".bcrc" = inHome ".dots/.bcrc";
      ".gitconfig" = inHome ".dots/.gitconfig";
    };
  };
}
