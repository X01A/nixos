{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "ea2118396074c52592792f8a308d50b0efd83888";
    sha256 = "sha256-icQFXsyXb4vXigga8U6tLb5fwiD5k+FVHi8lar+nk/A=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
