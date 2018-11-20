{
  stdenv,
  fetchurl,
  cmake,
  python,
  shared ? false
}:
let
  inherit (stdenv.lib) optional optionals;
  version = "1.2";
in

stdenv.mkDerivation rec {
  name = "gau2grid-${version}";
  src = fetchurl {
    url = "https://github.com/dgasmith/gau2grid/archive/v1.2.0.tar.gz";
    sha256 = "173bcrkixdb5x0ll8jp4hlwivll9aislmyms0v41fkbrdhji40sw";
  };

  buildInputs = [ cmake python python.pkgs.numpy ];

  cmakeFlags = [
    "-DMAX_AM_ERI=8"
    "-DBUILD_FPIC=ON"
    "-DMERGE_LIBDERIV_INCLUDEDIR=ON"
    "-DCARTESIAN_ORDER=row"
    "-DSPHERICAL_ORDER=gaussian"
    # These shouldn't be needed...
    "-DCMAKE_INSTALL_LIBDIR=lib"
    "-DCMAKE_INSTALL_BINDIR=bin"
    "-DCMAKE_INSTALL_INCLUDEDIR=include"
  ]
  ++ (optional shared "-DBUILD_SHARED_LIBS=ON")
  ;

  enableParallelBuilding = true;

  meta = with stdenv.lib; {
    inherit version;
    description = "gau2grid";
    homepage = https://gau2grid.readthedocs.io;
    license = licenses.bsd3;
    platforms = platforms.all;
  };
}
