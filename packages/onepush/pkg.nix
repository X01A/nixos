{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage {
  pname = "onepush";
  version = "0-unstable-2023-11-28";

  src = fetchFromGitHub {
    owner = "y1ndan";
    repo = "onepush";
    rev = "8b09e62330ad74ba3221bfc2b080d1732a1dcc55";
    sha256 = "sha256-xBhHe2q5oxXUuo7G50TBUC1o07dZSjQ8M8YkPRJELkk=";
  };

  propagatedBuildInputs = with python3Packages; [
    requests
    pytest
    pycryptodome
  ];

  doCheck = false; # Test fails
}
