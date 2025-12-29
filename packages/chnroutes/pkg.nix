{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2025-12-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "16c7962c6bac35ae4e7ae27568cfd878d4f86407";
    sha256 = "sha256-IBJZoMCgFUE6ZOPwBKsON5ozZvjS1B8u+dF7imyjE14=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
