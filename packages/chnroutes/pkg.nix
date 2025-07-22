{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b0a7ccceb59481aaea91266785df16d6ef47f3ae";
    sha256 = "sha256-caZN46Fmr+Go03JcDzg+s3zgoNCgZEmmIrJvrD3R8Go=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
