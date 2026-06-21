{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "4603da0ad4d482b44758770f0d7edd6401c2217f";
    sha256 = "sha256-AMTZnA1rR4sVgfjCbWpS8d+OH0i2DLH0yu5pQyInTCY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
