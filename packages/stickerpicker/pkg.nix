{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage rec {
  pname = "stickerpicker";
  version = "0-unstable-2024-06-05";

  src = fetchFromGitHub {
    owner = "maunium";
    repo = pname;
    rev = "dbc3a9fbb8017cf91404d50be9986b89a1a56275";
    sha256 = "sha256-CumbxEruX75QiGYZ8wzM+3z2tK5jabLhmzm4CIKrd4U=";
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
}
