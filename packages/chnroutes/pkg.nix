{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "e96a540e642cea749b658026207a7d995a8d6005";
    sha256 = "sha256-Ux8wGbaRmmnNoqj3rutepoycPyzPAWh/wbDNaAa0/CU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
