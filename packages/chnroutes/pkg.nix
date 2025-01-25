{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d9c924b58d832da0b20b97c7e1c0cdd53ead1706";
    sha256 = "sha256-OPtcXp7BQjhL+vukOX91MdI0VCFVCxtLfTtbBPCnoiE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
