{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e277b825ffee0f2855649fe311caaaffed9594da";
    sha256 = "sha256-6MLzKur3a+RqV0C/coyIfkbILzBkQYcsVqcEH8ct3XI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
