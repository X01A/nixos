{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "6e7e2e8763cdfcd6646cc4339399fe55ca191412";
    sha256 = "sha256-UeEjkmJEvOURC3L49dP5Y67dRIpjKUBdsMLw+icBIsI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
