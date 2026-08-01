{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "e15e47c9b037af8f0148cbfa6b91f70763f71014";
    sha256 = "sha256-RTc2V5iWGfR5CziskdRQpipHb/hDChsME4j3UqiA4IU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
