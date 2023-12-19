{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b52dc52126c3839f046ebf31b7cc5aa7e0657159";
    sha256 = "sha256-tmKOd7f29M68sVPKBOgMrjJWFD0hv00eZgwFcu5EaB4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
