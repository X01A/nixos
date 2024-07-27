{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "5713f017411187aaed06c931d949a15fb0c73ecd";
    sha256 = "sha256-CtScsg9dnNl39OUxpj2bNP8/sKIGBGEdbVkdU2AWgag=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
