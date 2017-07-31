{

  allowUnfree = true;

  packageOverrides = pkgs : with pkgs; rec {

   all-env = [
     apps-env
     archivers-env 
     base-env 
     development-env 
     nix-tools-env 
     security-env
     spelling-env 
     tools-env 
   ];

   base-env = buildEnv {
     name = "base-env";
     paths = [
       acpi
       bgs
       bmon
       dmenu
       dunst
       i3lock
       inotify-tools
       xbindkeys
       xlibs.xinput
       xlibs.xmodmap
       xorg.xmessage
       xorg.xvinfo
     ];
   };

   tools-env = buildEnv {
     name = "tools-env";
     paths = [
       ghostscript
       imagemagick
     ];
   };

   nix-tools-env = buildEnv {
     name = "nix-tools-env";
     paths = [
       cabal2nix
       nixpkgs-lint
     ];
   };

   archivers-env = buildEnv {
     name = "archivers-env";
     paths = [
       atool
       zip
       unzip
     ];
   };

   apps-env = buildEnv {
     name = "apps-env";
     paths = [
       areca
       calibre
       drive
       evince
       feh
       firefox
       geeqie
       google-chrome
       liferea
       meld
       pass
       pass
       pdftk
       phototonic
       quasselClient
       rambox
       spotify
       taskwarrior
       vlc
     ];
   };

   spelling-env = buildEnv {
     name = "spelling-env";
     paths = [
       aspell
       aspellDicts.it
       aspellDicts.en
       aspellDicts.nb
     ];
   };

   development-env = buildEnv {
     name = "development-env";
     paths = [
       autoconf 
       automake
       boost
       ccache
       clang
       clang-analyzer
       clang-tools
       cmake
       doxygen
       gcc
       gdb
       gfortran
       lcov
       libtool
       lldb
       openmpi
       valgrind
       zlib
     ];
   };

   security-env = buildEnv {
     name = "security-env";
     paths = [
       gnupg1
       keybase
     ];
   };
   
  };
}
