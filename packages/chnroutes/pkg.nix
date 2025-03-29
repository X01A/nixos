{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b7083d5f69a4dfb64eebeea48516d88790769864";
    sha256 = "sha256-dFEEjv94OKVXEZcUWdprtdq+x97FLOT4lRwqJk+AIvE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
