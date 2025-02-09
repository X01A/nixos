{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "86dea6a3effe528c1cdc44d43f14c1543d68e061";
    sha256 = "sha256-sX9dxmEH0QBnrojTzBGjFwunD8k+DPqa2VbvBC4aVFk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
