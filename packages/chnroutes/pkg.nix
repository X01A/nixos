{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "297cc21b337346308da2552259374a4dfbb4201b";
    sha256 = "sha256-DLVBr41GkO3dp2lAduZmg6Jlk+qqGQ/mFESMFePaJOw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
