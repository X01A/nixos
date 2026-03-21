{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "c1e9275f2ecdd0aee9b0047f39a88632849448e9";
    sha256 = "sha256-rlzutdy3KxJDlHuMwq1YQ7uniqz+DxeZcXjSAuZytsY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
