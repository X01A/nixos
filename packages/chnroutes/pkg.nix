{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "a7259e76dfe5cb4162d2d8112c4590b39f5fb65e";
    sha256 = "sha256-prYToh7WvMhpljjLgFnRMBd4C5m5wLbDlnMSyjXqyvY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
