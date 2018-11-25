{
  stdenv,
  fetchFromGitHub,
  cmake,
  gfortran,
  shared ? false
}:
let
  inherit (stdenv.lib) optional optionals;
in

stdenv.mkDerivation rec {
  name = "json-fortran-${version}";
  version = "6.10.0";

  src = fetchFromGitHub {
    owner = "jacobwilliams";
    repo = "json-fortran";
    rev = "6.10.0";
    sha256 = "0df8ld8w5l71qcnna96lj7f1hzxilm6m7anja6y7bzv3i1ablgi9";
  };

  buildInputs = [ cmake gfortran ];

  cmakeFlags = [
    "-DUSE_GNU_INSTALL_CONVENTION=ON"
    "-DENABLE_UNICODE=ON"
    "-DSKIP_DOC_GEN=ON"
    "-DENABLE_TESTS=OFF"
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
    description = "json-fortran";
    homepage = https://github.com/jacobwilliams/json-fortran;
    license = licenses.bsd3;
    platforms = platforms.all;
  };
}
