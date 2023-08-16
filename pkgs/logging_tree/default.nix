{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
}:

buildPythonPackage rec {
  pname = "logging_tree";
  version = "1.9";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "brandon-rhodes";
    repo = "logging_tree";
    rev = "b2d7cee13c0fe0a2601b5a2b705ff59375978a2f";
    sha256 = "wNAoiMXT9gO+eQc7RmtJ80YmwfEPf+JkmlGg3Ot2WFE=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "logging_tree" ];
}
