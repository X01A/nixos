{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4c8aa82c475ba4976313995e3e2bf0c54801ccad";
    sha256 = "sha256-95H/vO1yDaDgNAOf5k0C2wXKpcVlQSdJFkQjmEpSW90=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
