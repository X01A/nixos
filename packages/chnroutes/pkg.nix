{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "15048c408de732e8adc8c680c85cab8e820cae87";
    sha256 = "sha256-950nkoKL7BGMyLFGto39zy8CWbWKo1Wd5WZIlhA0XBY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
