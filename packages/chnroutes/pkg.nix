{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "bc52d06935075ef177a5de696091ec79dfea22cf";
    sha256 = "sha256-1qmnlqIQFbVcMz8Y7v+Otx/PuhGoYo852bqOgmIS614=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
