{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "9857ab3c22eea7d3e6e39fb36d0ff31935d52337";
    sha256 = "sha256-e66r2udzp8qEIvL8t/0rZ4z+M2TVKanv/5WZGEcrXqw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
