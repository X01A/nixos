{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "ff37d2b47f389a14e895441df5468c14019e1680";
    sha256 = "sha256-SYgpjNEa6c8+zhELkyuAtABizl2pJH7oD41YlG4MEeg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
