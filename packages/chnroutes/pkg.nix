{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e4b7c8e3288a474f760ad53330fde63411ecd25d";
    sha256 = "sha256-R4bknnyGmsnKFzisyZ3hn7AxYGELsK6Qd3uW0EAlcq0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
