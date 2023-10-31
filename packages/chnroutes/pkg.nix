{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-10-31";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d6bf87eb66a0503331ae7692a4517901a9db9b11";
    sha256 = "sha256-q9+6oX1flzdvIcQ6m8Iq73859G6csvo8MkBOsst6Aas=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
