{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "8aed3cd38e8ada68322817316b1d3d634eb185cf";
    sha256 = "sha256-YmaEt6WINwqL22G5r/L2kInQF2JfAteIP9McaJQg1S8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
