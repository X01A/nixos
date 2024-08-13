{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "fbe35ced622eec99fc4f64a06b6dd4283183fda5";
    sha256 = "sha256-7+hx62MUy2jz42ebHDiFz6/BNFR0ZUJww5FTjaM5ip4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
