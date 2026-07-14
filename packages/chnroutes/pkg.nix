{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "71db476bbfe2cc51624926b5a8a347e5d1d5ea43";
    sha256 = "sha256-DexIfM1JFzcFSGUOWXjNaBsNURJoHgLGrV8sC3SuExI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
