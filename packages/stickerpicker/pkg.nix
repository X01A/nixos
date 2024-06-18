{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage rec {
  pname = "stickerpicker";
  version = "0-unstable-2024-06-17";

  src = fetchFromGitHub {
    owner = "maunium";
    repo = pname;
    rev = "6332613e13dd6378b58f8cf557419c127bb2ab1d";
    sha256 = "sha256-tpNDmi8E2BiJWc2oZdjbpfkKwJy+e28KGCmDvRXa3KM=";
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
