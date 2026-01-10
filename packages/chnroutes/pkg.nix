{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "c40cc381abb487babff6f948b2a8826773cd303e";
    sha256 = "sha256-Q1Y/H1Vqm0Wv8zqCx5JbpPa+bTJhdYZnnaE53+8ugyc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
