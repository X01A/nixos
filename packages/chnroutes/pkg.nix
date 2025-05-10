{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "229ff766cd06324bc9c8378337d34853d7efba7c";
    sha256 = "sha256-KCrrGQJRs0TKoVvN2u8pSi+WTVxTVF9rqwReZohjvVI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
