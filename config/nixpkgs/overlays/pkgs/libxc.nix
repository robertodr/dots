{
  stdenv,
  fetchFromGitHub,
  cmake,
  perl,
  shared ? false
}:
let
  inherit (stdenv.lib) optional optionals;
  version = "4.0.2";
in

stdenv.mkDerivation rec {
  name = "Libxc-${version}";
  src = fetchFromGitHub {
    owner = "psi4";
    repo = "libxc";
    rev = "a5eb119fcca10d89cddc2c7547408debeb1e34f7";
    sha256 = "04m9dl4cxnaajxp38pfdr3knwppxvzd2avmyygcn73cvq91nlwja";
  };

  buildInputs = [ cmake perl ];

  cmakeFlags = [
    "-DNAMESPACE_INSTALL_INCLUDEDIR=/libxc"
    "-DBUILD_FPIC=ON"
    "-DBUILD_TESTING=OFF"
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
    description = "Libxc";
    homepage = https://github.com/psi4/libxc;
    license = licenses.mpl2;
    platforms = platforms.all;
  };
}
