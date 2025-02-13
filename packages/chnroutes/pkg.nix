{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "54b05840f73a9514dd6fa68cc49f5dd1813c441c";
    sha256 = "sha256-ZXxygb/UJHUhqFEKp86GzRDsdHjeY00GUee80MGOTRQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
