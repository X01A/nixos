{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-11-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d8337e80013a9f28121d2a071fdf4e9306ae8dee";
    sha256 = "sha256-Zq2tG9csSn8EtSGJIFWsYqlyMLyGNr6x+ucqt9Pm4Ms=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
