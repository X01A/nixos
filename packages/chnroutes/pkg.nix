{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-31";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "617f15a46fd5474b23d231ffc865b42539cf6c91";
    sha256 = "sha256-McNOJPeL33WKJkp1pmK4lGToPbH/YNZUSuHkBnfzQBU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
