{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage {
  pname = "onepush";
  version = "1.1.0-unstable-2025-01-20";

  src = fetchFromGitHub {
    owner = "y1ndan";
    repo = "onepush";
    rev = "a2a88978ccd89e165a5dc71d4af9413a4516f485";
    sha256 = "sha256-MdI/PqLAJUOS/W14zN9YA0ZfgME+XRvTJ9nI+MLhg2A=";
  };

  propagatedBuildInputs = with python3Packages; [
    requests
    pytest
    pycryptodome
  ];

  doCheck = false; # Test fails
}
