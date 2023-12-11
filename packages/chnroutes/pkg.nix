{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "cd26839c707a23b3b48be2f81e9df1d5deffdd31";
    sha256 = "sha256-/Ovy2wml+LnOIPUaPAYXPfoxkrArg/NHa+Qk2Iy1a0o=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
