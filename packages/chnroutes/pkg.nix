{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "91d54d8e8d9c3c9457fc00300ff287e5d815de1c";
    sha256 = "sha256-g6v9owTePyM6FhhmmhtV3v7uPygD0s/JK4Yua6BWv3s=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
