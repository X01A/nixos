{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "eb8fba54795d4448b11afa010fbb5eece15f20f4";
    sha256 = "sha256-BAzme3284Py1yPKXxSijJ2qon44jsEK38Sbs6B6zCwM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
