{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2dedf2cc0d313da78b80dc39010e449997d5fe26";
    sha256 = "sha256-0Oa1FVcLV3E0XzSKn9DxJ5rUFIcLvNrDGHqMGmE29pw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
