{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "faff69af35e98cddb28814d27ea19a963627a354";
    sha256 = "sha256-L4l4rC+wtaJ96A/Df/Gk16Bi3D9yUL4z8hWkNX4Bpg0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
