{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "6587b39dbee8afa0bffa695b5eedf03c1291661a";
    sha256 = "sha256-FlUXMb/97nEeaH4dEBxff5iYAjnoVIasYXd5JLYUOZo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
