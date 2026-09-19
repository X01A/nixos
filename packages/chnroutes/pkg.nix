{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "cca5153f3e3a96994b3600b9102b32e5b26bf937";
    sha256 = "sha256-VOuSgS9aOU3ZvS2MUz/5kWALOWNiaQbvdazXpNk5JUs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
