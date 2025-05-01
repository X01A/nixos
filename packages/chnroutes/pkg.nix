{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "706832281d0a5477288ea19b0d6e145d9b7d2dc1";
    sha256 = "sha256-HIu9MKq+lI1Ixl1VTlnROxe4H5NUYptDmnKmimaNQ6s=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
