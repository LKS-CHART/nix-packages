{ lib
, buildPythonPackage
, fetchPypi
, ipywidgets
, numpy
, pandas
, scikit-learn
, scipy
, schedule
, sqlalchemy
, pillow
, cachetools
, psycopg2
, flask
, ipyevents
, typing-extensions
}:

buildPythonPackage rec {
  pname = "superintendent";
  version = "0.5.3";
  format = "flit";

  src = fetchPypi {
    inherit pname version;
    sha256 = "kgWnXBgSOmwQmz7smiR0/Y1Aa9oZNa0fSiCm9Zu4OIw=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml --replace "psycopg2-binary" "psycopg2"
  '';

  propagatedBuildInputs = [
    ipywidgets
    numpy
    pandas
    scikit-learn
    scipy
    schedule
    sqlalchemy
    pillow
    cachetools
    psycopg2
    flask
    ipyevents
    typing-extensions
  ];
}
