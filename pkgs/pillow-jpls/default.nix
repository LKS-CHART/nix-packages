{ lib
, buildPythonPackage
, fetchurl
, pythonOlder
, pillow
}:

buildPythonPackage rec {
  pname = "pillow-jpls";
  version = "1.2.0";

  format = "wheel";

  # we should be able to rewrite this using the optional arguments of fetchPypi
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/c8/8f/e031b735a680f290aa00fec0720834f7b4de66ec339096be1913759b9b4a/pillow_jpls-1.2.0-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
    hash = "sha256-0JeRmAGv6wojbyIDbLuuD99pj/l+k1BAhEEjp6P/Syk";
  };

  propagatedBuildInputs = [ pillow ];
}
