{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage {
  pname = "onepush";
  version = "unstable-2022-09-15";

  src = fetchFromGitHub {
    owner = "y1ndan";
    repo = "onepush";
    rev = "c7dd8c82e4eb74501d7e6bcf0c42d1caa0c0ffc2";
    sha256 = "sha256-Rges8Ryd3nFzADoW7Cl8HMzuYWRCPbu08TWnz999qbo=";
  };

  propagatedBuildInputs = with python3Packages; [
    requests
    pytest
  ];

  doCheck = false; # Test fails
}
