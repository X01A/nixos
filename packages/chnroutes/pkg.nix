{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3f247b9b6487ea98a692f606a29dc08ba23be2b3";
    sha256 = "sha256-uqkEJKDzc0hAT5RoXVQgVK3bWyOaH9qz0wA5R0XyNTo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
