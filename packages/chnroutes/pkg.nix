{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "aba3fe9367f8ac76d5ce0a347fdeeeb978ce366e";
    sha256 = "sha256-MKLTKBqgZHfAby5OyT8Y47i+Ukm6L0tzD9nrSAv4Cyk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
