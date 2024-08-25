{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9aeabc6e163b869aa8b8fc3f52f4b3fe6965fb73";
    sha256 = "sha256-0yMg0COtoFj7BJDO8S02WtJFvcoSGVGiyO0C1RDCSWQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
