{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c649e4e60d48bb0db501dd919a512de63ca31844";
    sha256 = "sha256-raaSphJKFiyuHERTev42qyHTW7M+UsLIGkAyBXWcHAc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
