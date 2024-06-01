{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ce8471c0e6001856c5b5afd48ae4c0aa768d191c";
    sha256 = "sha256-ATgYIjTJGi/c3Ic6KLXOYdpEkq1wpVdhPuhc+Tvttj0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
