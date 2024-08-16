{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8119c89538d107d1bf67de94820bc13807044933";
    sha256 = "sha256-5iuG0w39St1hAKu8c9EggoQEwCflrWc2m8UC/GsfpJw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
