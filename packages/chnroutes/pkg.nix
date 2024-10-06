{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "312b49d6a86bcc6cd7d94ab14912f06d3ec3b1e9";
    sha256 = "sha256-Tsq/Xnpx8UeOEUv/fcogCKkDPkpvx8aDjK980rtMZ9I=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
