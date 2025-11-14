{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-11-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "92ef349c00a05d14f517401a2dabb83d933d92ec";
    sha256 = "sha256-fhp6evQy8POiAD/FzKQ1gD3OMfq0siFHG2utyzIn948=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
