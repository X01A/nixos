{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e4ec4339a9bb4e282487cb702700b47d6336b981";
    sha256 = "sha256-MoJeI/QwF/pSRFmYiCkhKxCOjMhch5QKYkp3bqmBxFA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
