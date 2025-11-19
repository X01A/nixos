{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-11-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "96bf6495ee8d92ab865755698c647dc5696bf667";
    sha256 = "sha256-WwmoBl8Vdlorgw6pb812WUylxUxftePNNVTj9/esX5w=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
