self: super:
{
  respect = super.mkShell {
    name = "ReSpect";
    buildInputs = with self; [
      boost
      cmake
      gcc
      gdb
      gfortran
      liblapackWithoutAtlas
      openmpi
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
    ulimit -s unlimited
    '';
  };
}
