{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "cec29035c3b5cdab71e42eceecd956377a43065f";
    sha256 = "sha256-pjho2eXdSWI0A4lVaWX63D9lVESiLvVJ6pqVUtV55uo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
