{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "113f8549cd07beeb95a676d0df9ccb1fee191af8";
    sha256 = "sha256-3H6H0r8czO/JUt/GBykUYxH3WPRuCvdsDCpD6PG164s=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
