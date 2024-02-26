{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d5e4862f9a6ca90cbb47d0c1b25ced57b1f825d8";
    sha256 = "sha256-7xDco1TjM9mqehufbR8ZxettxHHxKhBablrAEj4AFGU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
