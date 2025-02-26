{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b96b1fa74da95ca94fac2b4db489ffaef79d8a18";
    sha256 = "sha256-TAVVZbSRzE7hUO3Xx1RXSMbUjOyQ5gfra+Dc/VaOag4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
