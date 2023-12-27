{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4782278f4e081cb85ca6629d40ae8c6793a67cd3";
    sha256 = "sha256-CSsDNE0gmTOw04mqvDQT4Z55Dr3A7fQX6K3u4QtmXZY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
