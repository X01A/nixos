{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7180df5f9d0b00c1c529bc8a663d8afff9cb8d34";
    sha256 = "sha256-YtmGQc3rSm6oKcnci5eHs2NcbBJyvsB0bXxQr/81acI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
