{ lib
, buildPythonPackage
, pythonOlder
, pytestCheckHook
, fetchFromGitHub
, poetry-core
, arrow
, matplotlib
, nibabel
, numpy
, opencv4
, pandas
, pillow
, pydicom
, requests
, retrying
, scikitimage
, tqdm
, dicom2nifti
, pyyaml
}:

buildPythonPackage rec {
  pname = "mdai";
  version = "0.13.3";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "mdai";
    repo = "mdai-client-py";
    rev = "refs/tags/v${version}";
    hash = "sha256-xsdQojjxFFOQ20oDoExmilEeZeXsb/A/9leerHgG0OQ=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml --replace 'opencv-python ="*"' ""
  '';

  nativeBuildInputs = [ poetry-core ];

  propagatedBuildInputs = [
    arrow
    matplotlib
    nibabel
    numpy
    opencv4
    pandas
    pillow
    pydicom
    requests
    retrying
    scikitimage
    tqdm
    dicom2nifti
    pyyaml
  ];

  nativeCheckInputs = [ pytestCheckHook ];
  doCheck = false;  # all tests require network access

  pythonImportsCheck = [ "mdai" ];
}
