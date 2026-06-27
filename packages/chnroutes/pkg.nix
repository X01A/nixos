{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "3f62f88baeb0c9fed989c2a496f06ccaff916cc5";
    sha256 = "sha256-1+uZPL9gVAsVU/BnHRL2241eRNU2t9j5eEn+yDxqaD8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
