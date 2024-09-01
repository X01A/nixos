{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "5c625a6f0b5bfb92904299f5af3670851df96d46";
    sha256 = "sha256-v9Nylh1aDpwmaTgZIUFuNMI4svEP/qODb6/uH2O+mQA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
