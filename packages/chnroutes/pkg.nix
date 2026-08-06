{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "1abefc195286a8e05a3918507f637d080e45d472";
    sha256 = "sha256-xVaT8X3ipw0XQaWx8hYvtoRTMOj70j3+CLzWVqrU7zk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
