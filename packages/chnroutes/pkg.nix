{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "efbfe216d7efc386bdcdbe5e8e1ac7f12ac85fbf";
    sha256 = "sha256-x5y7VEcEuPscridO0Ng0FHHg/3k3M5XxBT2spDrQ6tQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
