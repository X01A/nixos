{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "570a6cec93e4b408b4b2d3257b9dbbf1fe08d09c";
    sha256 = "sha256-9wT/8YkZdNwdZzyQoiRDmxAPGKfmLGCz/OcRbYgfkHs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
