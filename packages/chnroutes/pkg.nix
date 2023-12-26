{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "230af12eb497698c7aae47a7f8113b2bcf0ee089";
    sha256 = "sha256-zol0FbYS0QMnXOz/qjayL6Ol3WycyMcJWofpd9M/cW4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
