{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "5f11db5275367939bba11dce6dc159785abfbf8a";
    sha256 = "sha256-xQ/YEzPrF8Et9PTQop8iezH8YF31mt2LdrQCpjVBtc0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
