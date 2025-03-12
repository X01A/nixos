{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "46800098b63874073818e88aaa7c0f6e4185be04";
    sha256 = "sha256-5c1iTQUhTqIDckMikOo++cj1lhZQPPwamajfZJ79TWw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
