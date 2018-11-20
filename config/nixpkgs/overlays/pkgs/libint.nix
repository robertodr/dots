{
  stdenv,
  fetchFromGitHub,
  cmake,
  shared ? false
}:
let
  inherit (stdenv.lib) optional optionals;
  version = "1.2.0";
in

stdenv.mkDerivation rec {
  name = "libint-${version}";
  src = fetchFromGitHub {
    owner = "evaleev";
    repo = "libint";
    rev = "b13e71d3cf9960460c4019e5ecf2546a5f361c71";
    sha256 = "1k05b3q14hppsc4n50jx19ikp8rbhwkrkhmp0wjic2z7g7ydra37";
  };

  buildInputs = [ cmake ];

  cmakeFlags = [
    "-DMAX_AM_ERI=8"
    "-DBUILD_FPIC=ON"
    "-DMERGE_LIBDERIV_INCLUDEDIR=ON"
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
    description = "Libint";
    homepage = https://github.com/evaleev/libint;
    license = licenses.lgpl3;
    platforms = platforms.all;
  };
}
