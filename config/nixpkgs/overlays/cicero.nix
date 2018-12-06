self: super:
{
  cicero = super.mkShell {
    name = "cicero";
    hardeningDisable = [ "all" ];
    buildInputs = with self; [
      pipenv
    ];
    src = null;
    shellHook = ''
    SOURCE_DATE_EPOCH=$(date +%s)
    '';
  };
}
