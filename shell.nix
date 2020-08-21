let
  jupyter = import (builtins.fetchGit {
    url = https://github.com/tweag/jupyterWith;
    rev = "";
  }) {};

  iPython = jupyter.kernels.iPythonWith {
    name = "python";
    packages = p: with p; [ numpy ];
  };

  iHaskell = jupyter.kernels.iHaskellWith {
    name = "haskell";
    packages = p: with p; [ diagrams ihaskell-diagrams ihaskell-blaze ihaskell-charts SVGFonts palette blaze Chart MissingH ];
  };

  RustKernel = jupyter.kernels.rustWith {
    # Name that is shown in Jupyter interface
    name = "rust";
    packages = [ ];
  };

  IRkernel = jupyter.kernels.iRWith {
    name = "R";
    packages = p: with p; [ ggplot2 ];
  };

  jupyterEnvironment =
    jupyter.jupyterlabWith {
      kernels = [ iPython iHaskell RustKernel IRkernel ];
      directory = ./jupyterlab;
    };

in
  jupyterEnvironment.env
