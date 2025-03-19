{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "033ed311314d75d46d20c7d8f16a8f3cea07cb70";
    sha256 = "sha256-cfeWlsekFpsFTZwh8Ckg7Y8KL9Pgo9/SC16YI8b3yng=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
