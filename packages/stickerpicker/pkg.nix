{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage rec {
  pname = "stickerpicker";
  version = "0-unstable-2025-06-29";

  src = fetchFromGitHub {
    owner = "maunium";
    repo = pname;
    rev = "3366dbc5002046be058a71e7ed310811a122c081";
    sha256 = "sha256-P6MI+3SfQKpXyqGzZgsLBoZ2aOUbFxHbDhHbr6xJpXc=";
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
