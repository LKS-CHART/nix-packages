{ lib
, buildPythonPackage
, fetchPypi
, setuptools
, logx
, psycopg2
, six
}:

buildPythonPackage rec {
  pname = "pgnotify";
  version = "0.1.1561372201";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "UJ3+Qv3ibG6rBmaYrcZ5zwJr9tGi/uoO1Y139sN2zpk=";
  };

  postPatch = ''
    substituteInPlace setup.py --replace "psycopg2-binary" "psycopg2"
  '';

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [ logx psycopg2 six ];

  pythonImportsCheck = [ "pgnotify" ];
}
