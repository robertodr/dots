self: super:
{
  pcmsolver = super.mkShell {
    name = "PCMSolver";
    hardeningDisable = [ "all" ];
    buildInputs = with self; [
      boost
      bundler
      ccache
      clang
      clang-analyzer
      clang-tools
      cmake
      doxygen_gui
      ffmpeg
      gfortran
      graphviz
      lcov
      pipenv
      python3Packages.docopt
      python3Packages.jupyter
      python3Packages.matplotlib
      python3Packages.numpy
      python3Packages.pyyaml
      python3Packages.yapf
      valgrind
      zlib
    ];
    src = null;
    shellHook = ''
    export NINJA_STATUS="[Built edge %f of %t in %e sec]"
    SOURCE_DATE_EPOCH=$(date +%s)
    '';
  };
}
