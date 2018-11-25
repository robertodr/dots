self: super:
{
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
