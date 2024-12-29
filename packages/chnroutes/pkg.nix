{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "15d0a9ef1a32a681b5e0d007e29a98fa34bf8e0e";
    sha256 = "sha256-EK6BlozvY5wqaFQ2mgYqVPGHCNvb86RYFDcjCWHrLDc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
