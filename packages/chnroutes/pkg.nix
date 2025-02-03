{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "cbea76f5069bcc8149d90efc5dc287a39d34f928";
    sha256 = "sha256-1lHUCNESD06zMZ4uq4srY+YZw1+BJAPS07Y8zGHyVy4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
