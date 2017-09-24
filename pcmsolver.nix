with import <nixpkgs> {}; {
  pcmEnv = stdenv.mkDerivation {
    name = "PCMSolver";
    buildInputs = [
      boost
      bundler
      ccache
      clang
      clang-analyzer
      clang-tools
      cmake
      doxygen
      gcc
      gdb
      gfortran
      lldb
      openmpi
      python27Packages.breathe
      python27Packages.jupyter
      python27Packages.matplotlib
      python27Packages.numpy
      python27Packages.pyyaml
      python27Packages.recommonmark
      python27Packages.scipy
      python27Packages.sphinx
      python27Packages.sphinx_rtd_theme
      python27Packages.sympy
      zlib
    ];
  };
}
