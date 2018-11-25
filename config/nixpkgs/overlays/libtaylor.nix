self: super:
{
  libtaylor = super.mkShell {
    name = "libtaylor";
    hardeningDisable = [ "all" ];
    buildInputs = with self; [
      clang
      clang-analyzer
      cmake
      pipenv
      pybind11
      python3Packages.jupyter
      python3Packages.numpy
      python3Packages.yapf
    ];
    src = null;
    shellHook = ''
    export NINJA_STATUS="[Built edge %f of %t in %e sec]"
    SOURCE_DATE_EPOCH=$(date +%s)
    PATH=$PATH:$(dirname $(find /nix -name run-clang-tidy.py))
    '';
  };
}
