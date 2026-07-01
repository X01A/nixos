{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "8af74923f742683839442dee7e3e795cfa8335ee";
    sha256 = "sha256-lIf7wBZUsM/0c7VA+dTawm2VVZy52ZsmhKnpvxmUX00=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
