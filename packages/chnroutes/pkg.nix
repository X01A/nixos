{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "1cf18f0d639b3903649f4f638efaf5ad08bc6ab9";
    sha256 = "sha256-c0bTA/Ux+hNiIm8SBkVRVJn9pQRCwMg7if9bFDCNPW4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
