{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage rec {
  pname = "stickerpicker";
  version = "0-unstable-2025-03-25";

  src = fetchFromGitHub {
    owner = "maunium";
    repo = pname;
    rev = "4b96d236212b1212976f4c3c60479e7aaed866cb";
    sha256 = "sha256-PQ6Qv7VSumLa05Mrnylh1i8maWAHptd4vKwdElE4Tns=";
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
