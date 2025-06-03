{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage {
  pname = "onepush";
  version = "1.1.0-unstable-2025-06-03";

  src = fetchFromGitHub {
    owner = "y1ndan";
    repo = "onepush";
    rev = "cd5f4c3dcc0ed63c4f82f4bb9893c7a90eec6446";
    sha256 = "sha256-NCkfL+JS6z8reQ1et2d2dBADxzsLLjl5OZAb1x1GdqU=";
  };

  propagatedBuildInputs = with python3Packages; [
    requests
    pytest
    pycryptodome
  ];

  doCheck = false; # Test fails
}
