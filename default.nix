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
      # tmux configuration
      ".tmux.conf" = inHome ".dots/tmux.conf";
      # Desktop background
      ".background-image" = inHome ".dots/pulse-demon.png";
      # fish
      ".config/fish/config.fish" = inHome ".dots/config/fish/config.fish";
      ".config/fish/aliases.fish" = inHome ".dots/config/fish/aliases.fish";
      ".config/fish/functions/fish_prompt.fish" = inHome ".dots/config/fish/functions/fish_prompt.fish";
      ".config/fish/functions/fish_right_prompt.fish" = inHome ".dots/config/fish/functions/fish_right_prompt.fish";
      ".config/fish/functions/abspath.fish" = inHome ".dots/config/fish/functions/abspath.fish";
      ".config/fish/functions/wttr.in.fish" = inHome ".dots/config/fish/functions/wttr.in.fish";
      ".config/fish/misc/nix_fish_env.sh" = inHome ".dots/config/fish/misc/nix_fish_env.sh";
      # Neovim
      ".config/nvim/init.vim" = inHome ".dots/config/nvim/init.vim";
      ".config/nvim/nvimrc.before" = inHome ".dots/config/nvim/nvimrc.before";
      ".config/nvim/nvimrc.plugins" = inHome ".dots/config/nvim/nvimrc.plugins";
      # Stack
      ".stack/config.yaml" = inHome ".dots/stack/config.yaml";
      ".stack/shell.nix" = inHome ".dots/stack/shell.nix";
      # Liferea
      ".config/liferea/accels" = inHome ".dots/config/liferea/accels";
      ".config/liferea/cookies.txt" = inHome ".dots/config/liferea/cookies.txt";
      ".config/liferea/feedlist.opml" = inHome ".dots/config/liferea/feedlist.opml";
      ".config/liferea/feedlist.opml.backup" = inHome ".dots/config/liferea/feedlist.opml.backup";
      ".config/liferea/liferea.css" = inHome ".dots/config/liferea/liferea.css";
      ".local/share/liferea/liferea.db" = inHome ".dots/local/share/liferea/liferea.db";
      ## xmonad
      #".xmonad/xmonad.hs" = inHome ".dots/xmonad/xmonad.hs";
      #".xmonad/lib/NamedActions.hs" = inHome ".dots/xmonad/lib/NamedActions.hs";
      #".xmonad/lib/SubmapMenu.hs" = inHome ".dots/xmonad/lib/SubmapMenu.hs";
      ## Taffybar
      #".config/taffybar/taffybar.rc" = inHome ".dots/config/taffybar/taffybar.rc";
      ## Compton
      #".config/compton.conf" = inHome ".dots/config/compton/compton.conf";
    };
  };
}
