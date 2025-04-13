{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7f5ee9d0f26667b58d051c2311d95b383ff0f0e2";
    sha256 = "sha256-SV1J6pmGd28HCd15mxwjKVODRbvCu6kfsZ4DZwEO7aI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
