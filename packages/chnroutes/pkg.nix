{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "d703d34650005ca3279a0fa5504f51d68f268707";
    sha256 = "sha256-Ym9FOnPVLDDpEJDRBNMM0wC9NjUHkpdaaRmfWOVtP7o=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
