self: super:
{
  python3 = super.python3.override {
    packageOverrides = py-self: py-super: {
      matplotlib = py-super.matplotlib.override {
        enableTk = true;
        enableQt = true;
      };
    };
  };

  ninja-kitware = super.callPackage ./pkgs/ninja-kitware.nix {
    python = self.python3;
  };

  boost162 = super.boost162.override {
    python = self.python3;
  };

  liblapackWithAtlas = super.callPackage ./pkgs/liblapack.nix {
    shared = true;
    cblas = true;
    lapacke = true;
  };

  liblapackWithoutAtlas = self.liblapackWithAtlas.override {
    atlas = null;
  };

  liblapack = self.liblapackWithAtlas;

  libint = super.callPackage ./pkgs/libint.nix {
    shared = true;
  };

  gau2grid = super.callPackage ./pkgs/gau2grid.nix {
    shared = true;
    python = self.python3;
  };

  pybind11 = super.callPackage ./pkgs/pybind11.nix {
    python = self.python3;
  };

  libxc = super.callPackage ./pkgs/libxc.nix {
    shared = true;
  };
}
