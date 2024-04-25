{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d268f406a4dccbd2144cda25b20c5b9b646da797";
    sha256 = "sha256-O1ek8m6yGzBpKt7em9YkdiIxFXaQvSWIFM337AaTJlY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
