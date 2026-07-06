{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "cc69891cff1b330bc8dbb86bd2aa2abd93fb3b3b";
    sha256 = "sha256-HeiDr0szFSg/Hw4jHajpAIpycLVXcdXwLCZXSZzFypc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
