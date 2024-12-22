{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "5fd5c32e5c0a9b51aa1a6afc9ec79ce31e9e3216";
    sha256 = "sha256-h5OuDAioWkKRI9q9oi+fiKxjCzAuFmzwY4TAAFOD9Wg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
