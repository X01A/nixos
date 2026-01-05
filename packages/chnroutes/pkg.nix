{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "c582bb6ef30f76fad8e6b3f5d617f55a401136c3";
    sha256 = "sha256-135yXcljAKCmTvtGxeIywOoUu7IzTeJ2mSMMpbNVRg8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
