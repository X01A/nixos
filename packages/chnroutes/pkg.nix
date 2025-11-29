{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-11-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3d6d7e5991a3d0adc7d822a57992912816cbfeb7";
    sha256 = "sha256-v9Kb9k/ukYvBWMTOCbXDshrxOMLc4HhkKNF6YgCTNmk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
