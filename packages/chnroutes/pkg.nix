{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "5397eb290179d5b44732957e268ce6484a603015";
    sha256 = "sha256-C4Ajc5723MPBK1ANM9vi/3d9wzq0LNcvtfDPwopQBRw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
