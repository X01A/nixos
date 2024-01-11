{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3a44174b846599c892b3b9ef3dbe5506c3919b8c";
    sha256 = "sha256-OVjm+1/RVHQJInnKr9JqjXZFCDeK7iEGpM4O0L4d4gs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
