self: super:
{
  dalton = super.mkShell {
    name = "DALTON";
    buildInputs = with self; [
      boost
      cmake
      gcc
      gfortran
      liblapackWithoutAtlas
      python3Full
      python3Packages.docopt
      python3Packages.jupyter
      python3Packages.matplotlib
      python3Packages.numpy
      python3Packages.pyyaml
      valgrind
      zlib
    ];
    hardeningDisable = [ "all" ];
    src = null;
    shellHook = ''
    SOURCE_DATE_EPOCH=$(date +%s)
    '';
  };
}
