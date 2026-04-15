{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "3895462a37b3444d9af85d8101b3a7aa50fdba0d";
    sha256 = "sha256-NIXZNw0PAFwtoXyswqnSH92AojZWYiisSP4tW/BB9rE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
