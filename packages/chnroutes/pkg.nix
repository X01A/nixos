{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c25fadd2fa93e4ecbdb9d2d029d63a34870ce183";
    sha256 = "sha256-bltNuWZFZ+S3Y7lPtF01CdYNlX7QLEaiAu/CNEIHj8E=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
