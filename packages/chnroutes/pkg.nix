{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "8356d1aab0753d09dde3806831e65f097e4a3ac2";
    sha256 = "sha256-4hORFqaNkR79PF7r1RxRgg46N7Tv3Wrk0Q2A6OaikUM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
