{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "602583403644541127d63819e935dd7cdfe81b4e";
    sha256 = "sha256-Xw/JE+cgQZLLDskMgNO97c07FCRxvCtz+9vAv3i4WBg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
