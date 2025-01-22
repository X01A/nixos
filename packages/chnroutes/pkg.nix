{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "aa57760920a47a3ca5bfc3a42be4f765fa5a1028";
    sha256 = "sha256-VrOsCbOpk8imFroKBYYsuUjfLzRMRUljw+xOZQAbITo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
