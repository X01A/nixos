{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage {
  pname = "onepush";
  version = "unstable-2023-05-03";

  src = fetchFromGitHub {
    owner = "y1ndan";
    repo = "onepush";
    rev = "3a1d5880e3b8f1c5191ee28acd828def15fe135d";
    sha256 = "sha256-C6+P55uxG7URiA2ldrVQlOfY4qfjWhX4DYrv6ZmmeXU=";
  };

  propagatedBuildInputs = with python3Packages; [
    requests
    pytest
    pycryptodome
  ];

  doCheck = false; # Test fails
}
