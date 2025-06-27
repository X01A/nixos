{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "69fba7501a6d8a108025b48fae4b183e1743a2f0";
    sha256 = "sha256-njKdo2O1XurEv7sAas3fobuhHAI3ADm4kyJqA3u7tCI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
