{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-31";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "4417f4154c11a68067e110d0ffc635b27273af93";
    sha256 = "sha256-VCJSkfqxhpegfZS4m7vBCo/1xFx6XJCxs4d/LuwNTTc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
