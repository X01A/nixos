{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage rec {
  pname = "stickerpicker";
  version = "0-unstable-2024-05-18";

  src = fetchFromGitHub {
    owner = "maunium";
    repo = pname;
    rev = "47f17fde452b5e9f0c9e96ce0e2c878dd0574b7f";
    sha256 = "sha256-OjmeIkSds59i6lHG/M3Z+32k9nGgm/owJ4x+xwyx0Qs=";
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
