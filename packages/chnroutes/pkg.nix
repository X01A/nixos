{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "047f40c8644412370f76df255c7569ae0b85c5ea";
    sha256 = "sha256-A/J01zwG1o1H/CwiZ0T0PXLYvLgoAYSxLBpj2Im1lT4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
