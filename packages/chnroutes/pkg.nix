{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "2f83c44e9cf771308fa342b670190f78577b6600";
    sha256 = "sha256-3SmOET9VJ8yTc6QyZwcBhtwvzyYBhSMDziYvXCchy9g=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
