{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8d3106915f3a7298ec02ccf5db4d13f57741d079";
    sha256 = "sha256-spS+Nwh5HWX3Tf9q3MQGQNlwjHCZQllMjPlLlI+bR6k=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
