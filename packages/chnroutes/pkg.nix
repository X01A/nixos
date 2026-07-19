{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "37fdeea8dffa7124661334c0ed594ff6871bf63e";
    sha256 = "sha256-/DbzBrzUw8ggwHmGfjyJ2AHwuNG0M//Ux0OQxSqcLM0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
