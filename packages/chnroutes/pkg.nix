{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "17202c1b2c84422a2935d74560d5a350611cfbba";
    sha256 = "sha256-d2qwCft5zJFfde5fjYR5DlJ6DhDaRmAJ3gDYIfixkGQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
