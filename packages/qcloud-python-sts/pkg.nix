{
  lib,
  python3Packages,
  fetchPypi,
}:

python3Packages.buildPythonPackage rec {
  pname = "qcloud-python-sts";
  version = "3.1.6";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-f9vZ1NRVh3FOcx595YEu1E531woTnzQA/l5LWz3cMtM=";
  };

  propagatedBuildInputs = with python3Packages; [ requests ];

  doCheck = false;

  pyproject = true;
  build-system = [ python3Packages.setuptools ];

  meta = with lib; {
    homepage = "https://github.com/tencentyun/qcloud-cos-sts-sdk";
    description = "Tencent Cloud STS SDK for Python";
    license = licenses.mit;
    maintainers = with maintainers; [ indexyz ];
  };
}
