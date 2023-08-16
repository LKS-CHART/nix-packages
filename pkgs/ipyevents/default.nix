{ lib
, buildPythonPackage
, pythonOlder
, fetchPypi
, pytestCheckHook
, jupyter-packaging
, ipywidgets
, traitlets
}:

buildPythonPackage rec {
  pname = "ipyevents";
  version = "2.0.1";
  format = "pyproject";

  # GitHub dist needs npm
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-I+sq+rE9kFY5fxIKiAUd076wZ7aY0Iszrf/J4HfwGcs=";
  };

  nativeBuildInputs = [
    jupyter-packaging
  ];

  propagatedBuildInputs = [
    ipywidgets
    traitlets
  ];

  postPatch = ''
    substituteInPlace setup.py --replace "ensure_python('>=3.6')" ""
  '';
  
  # no tests in Pypi dist
  doCheck = false;
  checkInputs = [ pytestCheckHook ];
  pythonImportsCheck = [ "ipyevents" ];
}
