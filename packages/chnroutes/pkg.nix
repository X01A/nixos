{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "b1d1611ff02751236b51e6e0bddab01557df2181";
    sha256 = "sha256-rmmggMIOKsrVDSkdpEucDTnY/3+RdPhQnfpEXUt6Hb0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
