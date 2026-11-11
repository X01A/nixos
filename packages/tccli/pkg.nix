{
  lib,
  pkgs,
  python3Packages,
  fetchPypi,
}:

let
  cos-python-sdk-v5 = pkgs.callPackage ../cos-python-sdk-v5/pkg.nix { };
in
python3Packages.buildPythonApplication rec {
  pname = "tccli";
  version = "3.1.200.1";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-QZaPQffpYiqf/SqPcF8MNBH0NuzNxPY5N052M2YpaYY=";
  };

  propagatedBuildInputs = with python3Packages; [
    jmespath
    six
    requests
    tencentcloud-sdk-python
    cos-python-sdk-v5
  ];

  doCheck = false;

  pyproject = true;
  build-system = [ python3Packages.hatchling ];

  # tccli ships its own service/action definitions and only uses
  # tencentcloud.common.common_client from the SDK, so a slightly older SDK
  # from nixpkgs is fine.
  pythonRelaxDeps = [ "tencentcloud-sdk-python" ];

  pythonImportsCheck = [ "tccli" ];

  meta = with lib; {
    homepage = "https://github.com/TencentCloud/tencentcloud-cli";
    description = "Tencent Cloud Command Line Interface";
    license = licenses.asl20;
    maintainers = with maintainers; [ indexyz ];
    mainProgram = "tccli";
  };
}
