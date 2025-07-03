{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a1a8b87fc5fc44be3d288d547571c2abc061020b";
    sha256 = "sha256-2aMDCqG60JcOn6pD5V+dvZs4oJTD1FsUsuykU7H86sA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
