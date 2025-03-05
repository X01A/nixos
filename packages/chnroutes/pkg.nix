{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "bf4587ee1ab158a04644578d553e6288a4ac4c1a";
    sha256 = "sha256-rRg9IjBaN+ySAiasTY+9LOz1V+GYPvQ7ke+7pLdGn14=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
