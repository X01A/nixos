{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "86c2fba5770d395d3de2f20cbe78715c98132814";
    sha256 = "sha256-4oIfbYT4aYLIpvITYPtahsq1hDc5LmNHBa0dBL+ddmI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
