{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "97465e96b38fe96f418cc952d84e8bf72bd8088f";
    sha256 = "sha256-REfZVJ8sQ0vyAGwwxo/6ucEJOsV/6BN3zNA9EFPnzto=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
