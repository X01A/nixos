{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "403ad868391f378e017ae243ef1a97cb3eea1bbb";
    sha256 = "sha256-LHH3d1AmpWoD1/fbJalao5Ve5eYRsQGVt7qNYwiDjO0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
