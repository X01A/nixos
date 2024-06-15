{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0c9aca60427bcd58b8437441d58c5f04a03e7934";
    sha256 = "sha256-Id9SWlLfxlu0Ap3aa2rTjRh189sPvEuQknuwLkgEzH4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
