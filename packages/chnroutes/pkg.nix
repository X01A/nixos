{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "aa6432c8994a20485d18a98ffd7274317dee0a3e";
    sha256 = "sha256-jtxa6+ctF1vj+Ksm3MM7aCbwygjggOujSMoJpE+rJNs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
