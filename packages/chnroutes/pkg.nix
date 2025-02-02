{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "aae53a13465444e019912a503cbf62e07de562a8";
    sha256 = "sha256-nzCmS1PE5hPijDPqBeAwW7i32npJOr3QatpFC3NLC7Y=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
