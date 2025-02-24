{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "816b8bc8e8355b3274b0d2767dab1867d39a8530";
    sha256 = "sha256-bvveDEbMbFL9Yy7NyIwNzSu3+kjYPO3gt5Xe5KJaqQQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
