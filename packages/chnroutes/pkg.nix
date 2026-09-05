{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "380d14055a84f0babf1abbfcd29a3da25d51c055";
    sha256 = "sha256-dzANTQz/1elKtTBSusMPyUlv5E6qVkZbV1LmpHXZt8s=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
