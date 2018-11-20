self: super:
{
  psi4 = super.mkShell {
    name = "Psi4";
    hardeningDisable = [ "all" ];
    buildInputs = with self; [
      boost
      bundler
      clang
      clang-analyzer
      clang-tools
      cmake
      gdb
      gfortran
      liblapackWithoutAtlas
      lldb
      #mkl
      libint
      libxc
      pybind11
      gau2grid
      ninja-kitware
      pipenv
      python3Packages.jupyter
      python3Packages.matplotlib
      python3Packages.numpy
      python3Packages.pint
      python3Packages.pytest
      python3Packages.sphinx
      python3Packages.yapf
      valgrind
      zlib
    ];
    src = null;
    shellHook = ''
    export NINJA_STATUS="[Built edge %f of %t in %e sec]"
    SOURCE_DATE_EPOCH=$(date +%s)
    PATH=$PATH:$(dirname $(find /nix -name run-clang-tidy.py))
    '';
  };
}
