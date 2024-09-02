{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ec1a747106c926946a63fb5288e65990bc40da1e";
    sha256 = "sha256-oYoQBhfWn8jENofjqOqnqhOP6VRe+X7CbQICpQkkoII=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
