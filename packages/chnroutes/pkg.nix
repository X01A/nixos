{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8acd5837a05c5db3e26acd44ac9ab44f640559fd";
    sha256 = "sha256-yaQlo5ZWG6qOGCmjXSeFUK+yDVsgMbGXPeR7KLL8wqw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
