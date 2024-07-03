{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "da154e7796e94273fb1468d3cb371a0dc3aa99a0";
    sha256 = "sha256-lJiycFinDNPr11hRn5iyR5u5XOT9wnN5mU1FCCwXh6g=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
