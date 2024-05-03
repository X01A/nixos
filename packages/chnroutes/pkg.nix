{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7d9cb490b6f5797a01aa01193f8718f8e38a8d8f";
    sha256 = "sha256-T8owtbbxzM5aZJ9bCzA+JeNo2/GUx/L58orfpVnWiQE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
