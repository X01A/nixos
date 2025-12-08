{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8f93c169fb237138b55119743bcd7601f8eb1f4a";
    sha256 = "sha256-ZzJVMSu2+r42DzLS59Ymhn3WVj3PwXMRJlPDJEcruuY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
