self: super:
{
  xcfun = super.mkShell {
    name = "XCFun";
    hardeningDisable = [ "all" ];
    buildInputs = with self; [
      bundler
      ccache
      clang
      clang-analyzer
      cmake
      doxygen
      exa
      gcc
      gfortran
      graphviz
      lcov
      pipenv
      pybind11
      python3Packages.docopt
      python3Packages.jupyter
      python3Packages.matplotlib
      python3Packages.numpy
      python3Packages.pytest
      python3Packages.pyyaml
      python3Packages.yapf
      swig
      valgrind
    ];
    src = null;
    shellHook = ''
    export NINJA_STATUS="[Built edge %f of %t in %e sec]"
    SOURCE_DATE_EPOCH=$(date +%s)
    PATH=$PATH:$(dirname $(find /nix -name run-clang-tidy.py))
    '';
  };
}
