{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "129efd5568448c2f7d1cd87ef21926609a6a6bbe";
    sha256 = "sha256-2LvUczruvG7AHxMFzCLWR44dPam2/i0CiBw8xCZTqJo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
