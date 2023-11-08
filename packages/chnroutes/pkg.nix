{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "47248a283c9b1d79b63f97b065e0255ef51d1290";
    sha256 = "sha256-fpnSPydHzxl7UbSxbmmtteyGSe4n/1F5EpisZx6IWPg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
