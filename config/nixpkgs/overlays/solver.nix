self: super:
{
  solver = super.mkShell {
    name = "solver";
    hardeningDisable = [ "all" ];
    buildInputs = with self; [
      mypy
      pipenv
      python3Packages.bokeh
      python3Packages.jupyterlab
      python3Packages.matplotlib
      python3Packages.numpy
    ];
    src = null;
    shellHook = ''
    SOURCE_DATE_EPOCH=$(date +%s)
    '';
  };
}
