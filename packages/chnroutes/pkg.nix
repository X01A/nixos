{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2eb83bd543c6659b216163e994f166d0403425ea";
    sha256 = "sha256-wm4cT0pgdKnZeXsJ8QcM+9ruKbL4639w6k58weqAqlk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
