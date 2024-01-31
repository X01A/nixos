{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-31";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f406448701b23ac5d9991a5b1236f0c5753ba3e3";
    sha256 = "sha256-DWf1hAQY+gUP7kXvcz5sFO6VkpqKS5Gm8YkrlSLbnKw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
