{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage rec {
  pname = "stickerpicker";
  version = "0-unstable-2026-02-18";

  src = fetchFromGitHub {
    owner = "maunium";
    repo = pname;
    rev = "4c13a2c254d68980bcf43f132e0b78e3c08ed3b1";
    sha256 = "sha256-BL8imNmJboigP2wTRNdi/McwBRv8CXCByhWYdZG43y4=";
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
