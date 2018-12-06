self: super:
{
  hande = super.mkShell {
    name = "HANDE";
    buildInputs = with self; [
      cmake
      gcc
      gdb
      gfortran
      hdf5-fortran
      liblapackWithoutAtlas
      libuuid
      lua5_3
      openmpi
      pipenv
      python3Packages.matplotlib
      python3Packages.numpy
      python3Packages.pandas
      python3Packages.pyyaml
      python3Packages.scipy
      valgrind
    ];
    hardeningDisable = [ "all" ];
    src = null;
    shellHook = ''
    SOURCE_DATE_EPOCH=$(date +%s)
    '';
  };
}
