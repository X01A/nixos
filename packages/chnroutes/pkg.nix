{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "035ed0cb0b3a0b165407716f6a47c1d177ca8397";
    sha256 = "sha256-McCMNQMwEQdmxxbm0xChAcVMi7nsevoEQ+zZKgSMV8A=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
