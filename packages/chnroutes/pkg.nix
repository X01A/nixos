{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "a6cca0fca47a739f87b719cb8a04e3446b401a23";
    sha256 = "sha256-p7d6IOrbMTU1zg4AP/52Z1ESEzGs7m+BZfC2i0QjxGA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
