{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage rec {
  pname = "stickerpicker";
  version = "0-unstable-2024-06-19";

  src = fetchFromGitHub {
    owner = "maunium";
    repo = pname;
    rev = "333567f481e60443360aa7199d481e1a45b3a523";
    sha256 = "sha256-RKAAHve17lrJokgAPkM2k/E+f9djencwwg3Xcd70Yfw=";
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
