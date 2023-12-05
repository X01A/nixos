{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0631e501aa44c5bfe872abf1e6bf70a93c273b57";
    sha256 = "sha256-flHWJhpIniomMKnw0ivIHzNn0sgzoEIucUZuXO+7XIc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
