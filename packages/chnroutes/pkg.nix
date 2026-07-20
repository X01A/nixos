{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "efd0053baa4b3534e2b2b05ea03995d717f14128";
    sha256 = "sha256-39+OAkd35UfDbRI5EGe+z8PFmeeBpUekwti8d4fpFkk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
