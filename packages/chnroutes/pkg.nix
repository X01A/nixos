{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9007baa6d6a0191d9396d340fcb1a549a6d4c1f6";
    sha256 = "sha256-9I6ncK9g0gNRx0vSkUdx5Zq1bAVCZxMpi6mEyzSlY+4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
