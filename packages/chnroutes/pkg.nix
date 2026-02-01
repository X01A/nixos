{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "1eb0c60a5e4d6cc2efa2ae610842c2aacd0443f3";
    sha256 = "sha256-dw7hUgFhxff7FSWs8dHDLQXSMk94FWX0F0cF6uWqco0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
