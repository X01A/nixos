{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "c0d19fc79e02f1649dd2bf71f5179f928e020168";
    sha256 = "sha256-jxaTH8H4LcwgTbA2guUz7WBhUHtcVcdy+meNZu0gQdw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
