{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4ea254e60b1bf0d3da844a5c63f4548c9aceb70b";
    sha256 = "sha256-xBnZM+0qds9rmcyMla4l/p8Ye3rUJJVnm3i2RwpNIW0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
