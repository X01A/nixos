{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7a18316de77b58e6a4735677e3f6959c80d67853";
    sha256 = "sha256-rsuQHY5PRavazJrh2QcSY2iWL0XDrHP9ACL+AYPkxAI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
