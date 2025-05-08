{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ef3890245164e5949c23ce7d1b5114e93fd47718";
    sha256 = "sha256-mkFVti4YQJk3M1vH0yt2uK7q4LnQMYytvKT38JzS2xA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
