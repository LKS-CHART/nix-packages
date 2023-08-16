{ lib
, buildPythonPackage
, fetchPypi
, setuptools
, pyyaml
, logging_tree
}:

buildPythonPackage rec {
  pname = "logx";
  version = "0.1.1579232358";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1EYJAJesg3B9ebHfmP+Xf/cXJyGktjpdQH49CM8XHhU=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [ pyyaml logging_tree ];

  pythonImportsCheck = [ "logx" ];
}
