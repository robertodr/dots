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
      gau2grid
      gdb
      gfortran
      libint
      liblapackWithoutAtlas
      libxc
      lldb
      #mkl
      ninja-kitware
      pipenv
      pybind11
      python3Packages.jupyter
      python3Packages.matplotlib
      python3Packages.networkx
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
