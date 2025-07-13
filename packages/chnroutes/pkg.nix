{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ade94e4f2474663645cb9e2033e99a1d96cc758a";
    sha256 = "sha256-SH5vqysAvLeKW6Eg90FZxwZEeFHBanV2O8oFfZcmnmE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
