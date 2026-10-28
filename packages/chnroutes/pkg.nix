{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "56c41be89017bd9c6b3175a92b0863bb375db065";
    sha256 = "sha256-I3s48bG97OforGfcy7LoNhsgqoIVgKIxLBPO8JU2wwg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
