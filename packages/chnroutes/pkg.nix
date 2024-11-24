{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "5579696be1e322f61e2443bc87319578b923664b";
    sha256 = "sha256-I+/R3Qk43kqqLgsragy7fbTVkO/h+yESEfcIGr43a84=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
