{ lib
, buildPythonPackage
, fetchFromGitHub
, fetchpatch
, pythonOlder
, pytestCheckHook
, numpy
, pillow
, pillow-jpls
, pydicom
}:

let
  # also used by pydicom in Nixpkgs, so maybe should be factored out into pydicom-data package in nixpkgs
  test_data = fetchFromGitHub {
    owner = "pydicom";
    repo = "pydicom-data";
    rev = "cbb9b2148bccf0f550e3758c07aca3d0e328e768";
    hash = "sha256-nF/j7pfcEpWHjjsqqTtIkW8hCEbuQ3J4IxpRk0qc1CQ=";
  };
in
buildPythonPackage rec {
  pname = "highdicom";
  #version = "0.21.1";
  version = "unstable-2023-07-26";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "ImagingDataCommons";
    repo = "highdicom";
    rev = "f453e7831e243e1f4d8493bfa79238a264c6e6b1";
    hash = "sha256-Biw6tzX+b9limW3We1q/GSite5GlMQIsetI7Ejj/oPA=";
  };

  propagatedBuildInputs = [
    numpy
    pillow
    pillow-jpls
    pydicom
  ];

  nativeCheckInputs = [ pytestCheckHook ];
  preCheck = ''
    export HOME=$TMP/test-home
    mkdir -p $HOME/.pydicom/
    ln -s ${test_data}/data_store/data $HOME/.pydicom/data
  '';

  pythonImportsCheck = [ "highdicom" ];
}
