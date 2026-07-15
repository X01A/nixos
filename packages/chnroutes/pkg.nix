{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "8577dc364e555b7fe2a3297124fdb19aa51b1371";
    sha256 = "sha256-bdEKxBoYHLyy80nB757XXnkbBf+T19VfLfiXjRJqKcg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
