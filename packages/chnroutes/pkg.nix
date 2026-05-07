{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "afe224ee0eb8792b2639e5903713eda23acbddaf";
    sha256 = "sha256-EoB5ZDMjpU7N/Qg5+TTVT+drYQqlyTtbislRV3oBWRc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
