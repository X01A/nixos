{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage rec {
  pname = "stickerpicker";
  version = "0-unstable-2024-12-02";

  src = fetchFromGitHub {
    owner = "maunium";
    repo = pname;
    rev = "89d3aece041c85ebe5a1ad4e620388af5227cbb0";
    sha256 = "sha256-1n7bPSCRw7keTCIu4tJGnUlkoId6H1+dPsTPzKo3Rrk=";
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
