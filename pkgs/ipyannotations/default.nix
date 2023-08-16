{ lib
, buildPythonPackage
, pythonOlder
, fetchPypi
, ipycanvas
, ipyevents
, ipywidgets
, palettable
, pillow
, requests
}:

buildPythonPackage rec {
  pname = "ipyannotations";
  version = "0.5.1";
  format = "wheel";

  # use wheel since otherwise npm etc are needed
  src = fetchPypi {
    inherit pname version format;
    hash = "sha256-2xzQCCDxnsb556ATA13dtEBm2D8Gu/g+78hP/gm4zaM=";
  };

  propagatedBuildInputs = [
    ipycanvas
    ipyevents
    ipywidgets
    palettable
    pillow
    requests
  ];

  # no tests in Pypi wheel
  doCheck = false;
  pythonImportsCheck = [ "ipyannotations" ];
}
