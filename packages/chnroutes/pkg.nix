{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "df31785359a56186ffac544fc49bdaa0261054d3";
    sha256 = "sha256-5Ui2zowOAjQJm8zPIca1WrUzyKv7iODx3ABiOUpZmB8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
