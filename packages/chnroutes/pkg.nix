{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "b3b81532d241eea5df4d12cf35bb1615577057a1";
    sha256 = "sha256-S640jP/6ub1Q704U7kvUjFC3mbUU5lrXPzWiPI5dUjQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
