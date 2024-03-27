{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-03-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "af20c40f19923289dec1aacf44a86aeae3b59865";
    sha256 = "sha256-qlwZ4YbHXkIzzziwCIkRirqX6O+2CGqrpjuDELtPbzU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
