{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "86dc4f56827255d3b4e0c973a9b8e24aeb67f06a";
    sha256 = "sha256-zvzFbNFf2BqzcScvBhCjhyJSm26kwX1+mVYZHNPRMo0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
