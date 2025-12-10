{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "725e37eb586a075f3089cd3c6879dbc3bef70837";
    sha256 = "sha256-oN9gtOMVKbMawRYfeAfSzzHFiWqA7YiFkdTEkTiub2Y=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
