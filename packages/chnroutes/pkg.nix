{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4d39cfd92d776a4ad517c5ffc396f7ce0946b36e";
    sha256 = "sha256-hD4DoPhYpkZrK2fspk2cQQr0APElngResz0qrzxggro=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
