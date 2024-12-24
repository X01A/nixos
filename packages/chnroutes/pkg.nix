{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "750df4297ffd4c0b9a20aa630e57a147e8250ce9";
    sha256 = "sha256-5UMzXQ97SohNPFVtYPqCetL5whqeQEA2OO1tc3CZY9c=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
