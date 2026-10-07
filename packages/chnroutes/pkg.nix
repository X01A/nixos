{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "7865c9f91f87f079a8d196fdcb8f5ab60593c2af";
    sha256 = "sha256-t2xqIM3Xa+7sb8z+Ot2ANSyIE4pgimJcqKr9pPvyJK8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
