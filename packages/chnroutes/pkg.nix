{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "1630bb553cae5dda154c67b2aa4a1e79da21dbec";
    sha256 = "sha256-N65wAlvVCpfEQmAMm/XzlyiuFqnr+RiyXJutiB8YQ8U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
