{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4528ca1c6727dbcc3ca108a9c4fea669eaac4e5a";
    sha256 = "sha256-tGkxRkI3PE2bM1GG4nYCSOwJoT3dXYyh2y5FB1KrzyM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
