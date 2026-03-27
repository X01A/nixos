{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "b70435913355cf6599a4d32358418b8da9177b14";
    sha256 = "sha256-+VDLoAdOeh6gP5zCNXv3VLB/rjpdE7gnL8K+3OUtO8c=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
