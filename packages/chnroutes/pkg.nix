{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "406bd0744b0ecd25a9a8d3d47ce5cd59fc758797";
    sha256 = "sha256-x0iLrKK2aRccFVDsbcZP/Yp5648Xw4WGtFGBbdj1+IE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
