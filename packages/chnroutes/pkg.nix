{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "1f022f8ab840600259aad833b70cd85c21a42edf";
    sha256 = "sha256-Sgf4421EMItv8pejM+md8n/TaVXNYWvtuBn/tQRQ/80=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
