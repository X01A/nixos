{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-03-31";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7873459493eaa41db0adc998c70258ef57cc4f0e";
    sha256 = "sha256-v7fkPMzoFf5uDF3PjDaT3s7v3xJAD1wpvpChV86xA+U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
