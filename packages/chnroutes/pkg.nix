{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d821ad988df667b106dc6bd0091aaa45c607a1dd";
    sha256 = "sha256-bSTQnDwBWzrvZ+UdlhJFCYOddgHy6YG68R/S8/ebhVQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
