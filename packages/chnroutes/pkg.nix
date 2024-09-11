{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "1cc3ab42b509e1135ea38f8d180fb44ba98c3536";
    sha256 = "sha256-f/4w6bWsKiAoVRP8hcnZwLNVeJq/S4Lx4shJioL2dts=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
