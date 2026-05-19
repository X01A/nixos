{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "845d94c435774f9154770f4a3291836b11f05e8b";
    sha256 = "sha256-aebW6/KtlH0aAcB89WzpYKmi7lJk+QQVSvF3ZbFK7Qw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
