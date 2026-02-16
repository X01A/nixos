{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "9973346ffd148a99bb0e2430d69f4dab3d802287";
    sha256 = "sha256-nVunFeODsNIJHrlVRQWsCDZCZlMzd5klz8szWVOyxLE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
