{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "b27955c7ea377114b4a1275e8baee45911c7f817";
    sha256 = "sha256-Vf99bjYJK+28/aniar6mloJtQwucuWzcLyeyJiKixvs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
