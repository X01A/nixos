{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8daf308ba45d00c7b144324ffcd9b6e6b4981d7f";
    sha256 = "sha256-vdaQ/9kZiKs/R1s5/8qO/ydRz7jpvankfBVKzzjt9MI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
