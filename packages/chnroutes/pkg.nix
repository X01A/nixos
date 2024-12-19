{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3bff8aa75731d34a00e620144fd810d32564ce77";
    sha256 = "sha256-1Ps0hMJ476AVQOhLidVRtHd5EmK6evUmNGGQBzf4Irs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
