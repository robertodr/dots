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
      ".aliases" = inHome ".dotfiles/.aliases";
      ".bcrc" = inHome ".dotfiles/.bcrc";
      ".gitconfig" = inHome ".dotfiles/.gitconfig";
    };
  };
}
