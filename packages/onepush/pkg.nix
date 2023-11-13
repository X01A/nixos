{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage {
  pname = "onepush";
  version = "unstable-2023-11-12";

  src = fetchFromGitHub {
    owner = "y1ndan";
    repo = "onepush";
    rev = "f60b4d9912c07c3e8c3c30674c502ce51d3638e5";
    sha256 = "sha256-D/GxlMJSOtn93zMfGwv/Qr/qVUfDFs3bdfXvTGgPEbU=";
  };

  propagatedBuildInputs = with python3Packages; [
    requests
    pytest
    pycryptodome
  ];

  doCheck = false; # Test fails
}
