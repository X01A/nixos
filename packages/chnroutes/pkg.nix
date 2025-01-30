{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "034d5ea0c56b49a096cf4495abe14667d7b7d5db";
    sha256 = "sha256-AR4MFxd1vpmAPGvVr9FmBOAsOQffusJLtJhG1dPm3cY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
