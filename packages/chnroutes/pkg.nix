{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "9c529fd78f45a3bcdd7944c25fcc406680191f7d";
    sha256 = "sha256-2YATa8fXKNRBZgfuZfMbu819/mG1C03S9A4mkc11oag=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
