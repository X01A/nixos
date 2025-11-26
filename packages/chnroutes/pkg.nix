{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-11-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b2384711ed5c896f201ea9fb0734bfc0ba376deb";
    sha256 = "sha256-vih4j4YSuf6/PmAdRcVV/KmWNytmbJaCcw41D0aAiBk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
