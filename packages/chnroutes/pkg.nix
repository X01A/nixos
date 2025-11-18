{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-11-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "74b626883f75d080dec69380fb95cd62f24c515e";
    sha256 = "sha256-mz2pJTo4aQPVcfh2BqdI6dU5zv+3KCrEWqY45zsjGKE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
