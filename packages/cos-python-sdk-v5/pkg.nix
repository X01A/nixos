{
  lib,
  pkgs,
  python3Packages,
  fetchPypi,
  qcloud-python-sts ? pkgs.callPackage ../qcloud-python-sts/pkg.nix { },
}:

python3Packages.buildPythonPackage rec {
  # The sdist is published as "cos_python_sdk_v5", while the project name is
  # "cos-python-sdk-v5"; keep pname normalized so the metadata check passes.
  pname = "cos-python-sdk-v5";
  version = "1.9.45";

  src = fetchPypi {
    pname = "cos_python_sdk_v5";
    inherit version;
    hash = "sha256-BnyHhIoBJ1HCn+sCrxGt5dSl9c1DHpgSD0zYU/5Is00=";
  };

  propagatedBuildInputs = with python3Packages; [
    requests
    xmltodict
    six
    crcmod
    pycryptodome
    qcloud-python-sts
  ];

  doCheck = false;

  pyproject = true;
  build-system = [ python3Packages.setuptools ];

  meta = with lib; {
    homepage = "https://github.com/tencentyun/cos-python-sdk-v5";
    description = "Python SDK for Tencent Cloud Object Storage (COS)";
    license = licenses.mit;
    maintainers = with maintainers; [ indexyz ];
  };
}
