{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "c223b1c5cc01835285002232a0d0afc61c9c9e8c";
    sha256 = "sha256-6Zvg0+waccNLPVs1KIZvdg74Z/P49jtqGKrqEQTTRRs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
