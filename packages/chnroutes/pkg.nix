{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "6812375aed7d9329c46104d81eed75a91dfe8b65";
    sha256 = "sha256-1dZqYVj9lDB3RWnGgyCEF54eCaN2pfpDIXk52Gw9OfM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
