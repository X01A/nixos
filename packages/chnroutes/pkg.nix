{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "732f36c3372abd2b2fe59a2c5ec54d824b26f2a0";
    sha256 = "sha256-jvSsRp6VdjJhpghUS91Vzs3vYZen1PuBsp/VMNZcEXs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
