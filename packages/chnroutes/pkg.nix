{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "70d163a79de98208d8376e97fc9f580975d67e65";
    sha256 = "sha256-udo3iLhHU6zmAdvhEMq2bkxo/ohnkgd7DGnwdS/ikWM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
