{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "6fc3a6c1941e973ef717a2f974667a7794341c8b";
    sha256 = "sha256-iEC99hjW8EjQuDXSuiu/KNx0gTohOfdQ0GvjrccQivg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
