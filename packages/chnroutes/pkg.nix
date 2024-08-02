{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e67577388db4965588ec016f5aa11e1f3e3b8f89";
    sha256 = "sha256-oIfJDJYZOfk8ziNuOUEv3sanyiEW/qOhPtDvGefFDmg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
