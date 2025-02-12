{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "795444e6d2e9d38af09f135b16f7089073496d47";
    sha256 = "sha256-zCHgy3xCuksfFzXiMYKtS0gZffVtBLBMty3kESrro2A=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
