{ lib
, buildPythonPackage
, pythonOlder
, fetchurl
, matplotlib
, pyyaml
, scikitimage
, scikit-learn
, chart-studio
, nibabel
, statsmodels
, webcolors
}:

buildPythonPackage rec {
  pname = "antspyx";
  version = "0.3.5";
  format = "wheel";

  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/e8/1c/f324098ce15c330c1adff72b49220cb88815b208485bfb52795f2028100c/antspyx-0.3.5-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
    sha256 = "y3LhIBPcQuEDr7GjgJIgSgMWIbX/2CW7ZQ1fwBYaF+k=";
  };

  propagatedBuildInputs = [
    matplotlib
    pyyaml
    scikitimage
    scikit-learn
    chart-studio
    nibabel
    statsmodels
    webcolors
  ];

  pythonImportsCheck = [ "ants" ];
}
