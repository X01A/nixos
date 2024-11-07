{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c3361885e0b53e756ec54aa1a6d54c13730b011d";
    sha256 = "sha256-VD76MrOAuCfWVegFSEbByDiVWwGKkV6sm8BxpcQf6eg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
