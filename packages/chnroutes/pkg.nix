{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ff001b0b078c02968c80ab093c287a6b87aa0e29";
    sha256 = "sha256-JubQdWCiigGYynGP2RaJQLZKvNaGQvwbayqvz9ZvN0c=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
