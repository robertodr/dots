self: super:
{
  mrchem = super.mkShell {
    name = "MRChem";
    buildInputs = with self; [
      boost
      clang-analyzer
      clang-tools
      cmake
      doxygen_gui
      eigen3_3
      exa
      gcc
      gdb
      graphviz
      lcov
      ninja-kitware
      pipenv
      python3Packages.click
      python3Packages.docopt
      python3Packages.pyparsing
      python3Packages.pyyaml
      python3Packages.yapf
      valgrind
    ];
    src = null;
    shellHook = ''
    export NINJA_STATUS="[Built edge %f of %t in %e sec]"
    SOURCE_DATE_EPOCH=$(date +%s)
    PATH=$PATH:$(dirname $(find /nix -name run-clang-tidy.py))
    '';
    hardeningDisable = [ "all" ];
  };
}
