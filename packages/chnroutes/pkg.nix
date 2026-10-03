{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "01b4e0205a0fc3939ad68b20bf57e6be5e465e19";
    sha256 = "sha256-0klB8mN1+Gxz3dvJANH/D5sgJEYAInK4ip5XpY5azOY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
