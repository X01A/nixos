{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ffd05bb3f9469eb1ccdd4b8ce9b042f1bdfdcf76";
    sha256 = "sha256-mgd9IN8Z4swt5Cz45gSCP/Z4L1VWa4vvnOKmJW9MC9M=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
