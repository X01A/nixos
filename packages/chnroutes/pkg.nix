{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e72610152fb3aacfc475a4096f20a7e436320b4c";
    sha256 = "sha256-sYTmMc99MN9tX0ZgSnkRL5yaFbT4jd9VMawgL8+g/fY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
