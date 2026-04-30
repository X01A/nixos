{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "9ff5f31ce2dec3360b1dcfb1c6beaab66ddfcf27";
    sha256 = "sha256-KNh4EcrtzEE6kXxA06NCjkFhAiUo3lmyXCdHHagWAgg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
