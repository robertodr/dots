{
  stdenv,
  fetchurl,
  cmake,
  python
}:

stdenv.mkDerivation rec {
  name = "pybind11-${version}";
  version = "2.2.4";
  src = fetchurl {
    url = "https://github.com/pybind/pybind11/archive/v2.2.4.tar.gz";
    sha256 = "07hq12s1h8ibg9wgrxh1yawk3lmp942lsm232j6mn88khmjq77mn";
  };

  buildInputs = [ cmake python ];

  cmakeFlags = [
    "-DCMAKE_CXX_STANDARD=14"
    "-DPYBIND11_TEST=OFF"
    # These shouldn't be needed...
    "-DCMAKE_INSTALL_INCLUDEDIR=include"
  ];

  enableParallelBuilding = true;

  meta = with stdenv.lib; {
    inherit version;
    description = "pybind11";
    homepage = https://pybind11.readthedocs.io;
    license = licenses.bsd3;
    platforms = platforms.all;
  };
}
