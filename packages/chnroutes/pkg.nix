{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "32c5cb7352589b1f7dd846fb47c03fa0fb61c97c";
    sha256 = "sha256-vwiKEYrzklBQOzbWsvXklWOOhfgqGcnl1Mb+lPb9PHc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
