{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "97c38f6111b3e84fc5493e3d63fa8021030dca1d";
    sha256 = "sha256-in1+pCSlLcrGMeGn3d/iloxsfmLvKJKdjFjMOZO0meQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
