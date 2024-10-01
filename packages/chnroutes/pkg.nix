{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ee642aefb3680a893e745db265389c0319e567c3";
    sha256 = "sha256-3PpE9Y2M5rbxkivtpVkagsIMP+auyEM2RLHLVJ7rbR0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
