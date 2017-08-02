with import <nixpkgs> {}; {
  pcmEnv = stdenv.mkDerivation {
    name = "PCMSolver";                                 
    buildInputs = [ 
      boost 
      ccache 
      cmake 
      doxygen
      python27Packages.breathe
      python27Packages.jupyter
      python27Packages.matplotlib
      python27Packages.numpy
      python27Packages.pyyaml
      python27Packages.scipy
      python27Packages.sphinx
      python27Packages.sympy
      zlib 
    ];
  };
}
