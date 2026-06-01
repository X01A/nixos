{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage rec {
  pname = "stickerpicker";
  version = "0-unstable-2026-05-31";

  src = fetchFromGitHub {
    owner = "maunium";
    repo = pname;
    rev = "c4ac072dd33ae5c89144d0222103786c8d8c1ba4";
    sha256 = "sha256-BElO5tD2KrcGdV5wjdEAtkRlkF8A5XYPUGqojRXPTyg=";
  };

  propagatedBuildInputs = with python3Packages; [
    aiohttp
    yarl
    pillow
    telethon
    cryptg
    python-magic
    pkgs.cacert
  ];

  doCheck = false;
  pyproject = true;
  build-system = [ python3Packages.setuptools ];
}
