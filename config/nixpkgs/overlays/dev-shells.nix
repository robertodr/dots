self: super:
{
  dalton = super.mkShell {
    name = "DALTON";
    buildInputs = with self; [
      boost
      cmake
      gcc
      gfortran
      liblapackWithoutAtlas
      python3Full
      python3Packages.docopt
      python3Packages.jupyter
      python3Packages.matplotlib
      python3Packages.numpy
      python3Packages.pyyaml
      valgrind
      zlib
    ];
    hardeningDisable = [ "all" ];
    src = null;
    shellHook = ''
    SOURCE_DATE_EPOCH=$(date +%s)
    '';
  };

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
    '';
    hardeningDisable = [ "all" ];
  };

  math-detect = super.mkShell {
    name = "math-detect";
    buildInputs = with self; [
      gcc
      cmake
      liblapackWithoutAtlas
      mkl
    ];
    hardeningDisable = [ "all" ];
  };

  solver = super.mkShell {
    name = "solver";
    buildInputs = with self; [
      mypy
      pipenv
      python3Packages.bokeh
      python3Packages.jupyterlab
      python3Packages.matplotlib
      python3Packages.numpy
    ];
    src = null;
    shellHook = ''
    SOURCE_DATE_EPOCH=$(date +%s)
    '';
    hardeningDisable = [ "all" ];
  };

  dev-shells = {
    cmake-cookbook = super.mkShell {
      name = "CMake-Cookbook";
      buildInputs = with self; [
        atlas
        boost162
        chrpath
        clang-tools
        cmake
        doxygen_gui
        dpkg
        eigen3_3
        gcc
        gdb
        gfortran
        graphviz
        libuuid
        ninja-kitware
        openblas
        openmpi
        pkgconfig
        pipenv
        python3Packages.breathe
        python3Packages.cffi
        python3Packages.colorama
        python3Packages.cython
        python3Packages.docopt
        python3Packages.numpy
        python3Packages.pyyaml
        python3Packages.sphinx
        rpm
        valgrind
        zeromq
        zlib
      ];
      src = null;
      shellHook =
        ''
        export NINJA_STATUS="[Built edge %f of %t in %e sec]"
        SOURCE_DATE_EPOCH=$(date +%s)
        '';
      hardeningDisable = [ "all" ];
    };
  };
}
