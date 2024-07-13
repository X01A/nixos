{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f384784a4158ef257c8ba8dc8e679596be2906fc";
    sha256 = "sha256-Ks0Dd6r8JE/vrMXwOxw5vKzsw95VD5H8CJGnhpyqSTI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
