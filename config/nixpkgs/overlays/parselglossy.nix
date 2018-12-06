self: super:
{
  parselglossy = super.mkShell {
    name = "parselglossy";
    hardeningDisable = [ "all" ];
    buildInputs = with self; [
      pipenv
      python3Packages.click
      python3Packages.jupyter
      python3Packages.pyparsing
      python3Packages.pytest
      python3Packages.pyyaml
      travis
    ];
    src = null;
    shellHook = ''
    SOURCE_DATE_EPOCH=$(date +%s)
    '';
  };
}
