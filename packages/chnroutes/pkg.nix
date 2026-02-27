{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "73c8f11ef3fe021fb53733e18774511e0983afc9";
    sha256 = "sha256-/+UrihOQuqvtYF3t2I0L26z9kDdz9OHEYJYpziFRoU8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
