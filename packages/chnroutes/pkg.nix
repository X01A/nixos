{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ecec7a86cd78c1170285530045714ad27161ae47";
    sha256 = "sha256-idkNaQnnIXQIS7RI3/+nYMFah7gErDtHB2dQFcQztuA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
