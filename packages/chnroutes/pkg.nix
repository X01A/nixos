{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "326f365c7c84f582d6adc3706440a1eebbffb7f0";
    sha256 = "sha256-tyqroTT/XndR3RTdOPpYQg79mlPNq20uMT9uEQfh2Ak=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
