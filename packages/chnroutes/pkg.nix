{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "60c329e6d6964d7a2bd52ad21328a7c5a7389eea";
    sha256 = "sha256-EgSeLVGdadajtUOfiSiqpIoRf4Pjm/afiq3urtv782Q=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
