self: super:
{
  autocmake = super.mkShell {
    name = "Autocmake";
    hardeningDisable = [ "all" ];
    buildInputs = with self; [
      ccache
      cmake
      doxygen
      gcc
      gfortran
      liblapack
      openmpi
      pipenv
      python3Packages.pep8
      python3Packages.pytest
      python3Packages.pyyaml
      zlib
    ];
    src = null;
    shellHook = ''
    export NINJA_STATUS="[Built edge %f of %t in %e sec]"
    SOURCE_DATE_EPOCH=$(date +%s)
    '';
  };
}
