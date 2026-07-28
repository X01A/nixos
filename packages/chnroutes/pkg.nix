{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "448e7bcabf235e939e3f90629109e70b9c942218";
    sha256 = "sha256-9q0gdMIlnsNqUkOadtpUxjm0yenkFr7dPh0Kr01o/y8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
