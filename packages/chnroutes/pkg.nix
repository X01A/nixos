{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "918dfcca79979d7fa13dabc324e5b2947d8351f7";
    sha256 = "sha256-3RQuRbAqKX/pZdC1zlbhAY8IE2K5kvxh5HzebE5/9do=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
