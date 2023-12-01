{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d72b03b5473e7222fb1e0086b4d77af7e27afc67";
    sha256 = "sha256-37Ck0ZR2MufVgpvNpKt+fVM7qNCY0UHAbLR3kYQM5qo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
