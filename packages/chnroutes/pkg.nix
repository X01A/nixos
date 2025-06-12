{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e13f13e5f901c618cd30e8714302e8f9ca5dfae5";
    sha256 = "sha256-TbmxQqQcE2T3RPsgeaFUUIkf0OmgTr3qaBpT2nxEjH0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
