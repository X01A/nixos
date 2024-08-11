{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "beb6b19c3911df11fc11440b70c6eb061de3fb13";
    sha256 = "sha256-fjQYapaZ9hY/On2G46yzn2JTzRsufU7x/QR5/8CMwoI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
