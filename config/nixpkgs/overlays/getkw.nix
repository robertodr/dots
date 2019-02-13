self: super:
{
  getkw = super.mkShell {
    name = "Getkw";
    hardeningDisable = [ "all" ];
    buildInputs = with self; [
      boost
      bundler
      ccache
      clang
      clang-analyzer
      cmake
      doxygen
      gcc
      gfortran
      graphviz
      lcov
      pipenv
      python3Packages.jupyter
      python3Packages.pyparsing
      python3Packages.pytest
      python3Packages.pyyaml
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
