{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "90f09b31fb61850cf28ba6b6c279c578c3d30f00";
    sha256 = "sha256-dfsDZPGhrSqK5ROJB2E3G60xYOfZiid5ar9AnD7V4iA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
