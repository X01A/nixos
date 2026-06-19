{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "25ce916b915de43df58d31cb54d2c4d433a4e181";
    sha256 = "sha256-MPZLlJAdb2tRS3RyNgiI+ohScW86iEGZOeCjFLNAMYg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
