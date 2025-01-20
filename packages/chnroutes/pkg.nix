{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2192d4407d4396df78d662ffc2456601a3280134";
    sha256 = "sha256-BIX/E6GLmyoQ+fNbU+DiJ8ryYLuK9VuAvcCdX1Bum+U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
