{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2372afe0ef8052f92cd651f0025769fef1361e08";
    sha256 = "sha256-zR2m+YMXv6xLzZbdESjHAI2tYjHQAguZ8UNnTwWvOOw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
