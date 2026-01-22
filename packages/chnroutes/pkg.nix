{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "7794f9e8bb6cdaff6e5e0721c0fd3cb44ce4bc00";
    sha256 = "sha256-PtFGxHh+Rqh7cxR+F5CrU8jS85TiYmdoYY/J0yAa6N4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
