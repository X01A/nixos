{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "cbd196cc5336cb42374934faadc6ad59137e2d92";
    sha256 = "sha256-VdGcJOC5zmdw5l9rSFe51GaggvXK1nRZdNXVmGfHEEU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
