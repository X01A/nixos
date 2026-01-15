{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "f007950b4b1c86a0942897b10e57ff0c5d04edfe";
    sha256 = "sha256-40GqtfsEx4TtigqjgFC6z8mO5BiP0/91aUTtKe6cvPE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
