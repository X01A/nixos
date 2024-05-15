{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f8ea088b54ee3fe213eb2a914f39b787a3bfd7e4";
    sha256 = "sha256-SAao97ORA85kz0uxTv5L4ruZOT4mAPs8HAfh7Hiwy88=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
