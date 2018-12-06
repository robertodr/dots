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
}
