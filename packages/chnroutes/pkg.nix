{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b0ff860a8e6c650bba0376702fefae2eef39837b";
    sha256 = "sha256-jyNEa+vhPa0YaYKpsWe+NJsCqsH1ZFxHrd5BcN+qBmc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
