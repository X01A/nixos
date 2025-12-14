{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "cc237aab63d9e02252e5864a6166140796e9b6f0";
    sha256 = "sha256-8UyGQqLTOAMeruI0XICHuuZZlhvRewSEoAIDG2meqgk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
