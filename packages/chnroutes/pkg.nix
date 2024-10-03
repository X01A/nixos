{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "bc79d03328514495763f667e5635da58a1f93b8c";
    sha256 = "sha256-S+ZbxFOsxFjikPHuvX/ZyWcseO7b9mp1FnnKMN2aIuM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
