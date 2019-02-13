self: super:
{
  mrchem = super.mkShell {
    name = "MRChem";
    buildInputs = with self; [
      boost
      clang
      clang-analyzer
      clang-tools
      cmake
      doxygen_gui
      eigen
      exa
      gdb
      graphviz
      lcov
      ninja-kitware
      pipenv
      pybind11
      travis
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
