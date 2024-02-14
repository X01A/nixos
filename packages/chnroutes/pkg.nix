{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "524f0231c18844656ac566b72744a0c02b99fd00";
    sha256 = "sha256-CREve1n6zY4X5Ifqb6gVD4TzI3wwbRHDtvZoNotLVkM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
