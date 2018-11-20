self: super:
{
  diagCCMC = super.mkShell {
    name = "diagCCMC";
    hardeningDisable = [ "all" ];
    buildInputs = with self; [
      clang
      clang-analyzer
      clang-tools
      cmake
      lldb
      mypy
      pipenv
      pybind11
      python3Packages.docopt
      python3Packages.jupyter
      python3Packages.matplotlib
      python3Packages.numpy
      python3Packages.pandas
      python3Packages.pytest
      python3Packages.scipy
    ];
    src = null;
    shellHook = ''
    export NINJA_STATUS="[Built edge %f of %t in %e sec]"
    SOURCE_DATE_EPOCH=$(date +%s)
    PATH=$PATH:$(dirname $(find /nix -name run-clang-tidy.py))
    '';
  };
}
