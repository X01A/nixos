{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "464a536a7c2af0a1cd50551f02bfa678a3822deb";
    sha256 = "sha256-hEjzekzb6Kucg7M4mn96dO/852EhA14XsB0ByCVyySk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
