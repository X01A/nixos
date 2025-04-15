{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "cad6dc05729791d7b3a4f8e04cf1fc3fdba00d8f";
    sha256 = "sha256-lUCThvXptM1zFy2cTVmAV5CM1BMwS1d8yG4wG3pMG0s=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
