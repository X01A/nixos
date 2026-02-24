{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "c9f8d11a7abd0a65ad4c326d9db3f09b496c055e";
    sha256 = "sha256-nSQO4heBp/3cTR0YcVoRaohfx4tK8CEfcqijy4NhMFY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
