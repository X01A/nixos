{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f0fbcb66bb6f4ceeecf5c9038ebf466e25c44ca4";
    sha256 = "sha256-Cv/buq2okCK4P9J4an7mzMwYeh74ash3kH7cy/g1WyM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
