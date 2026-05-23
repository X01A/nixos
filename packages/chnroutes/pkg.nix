{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "125fb9750174d7452d1edb0c615e1fcfc2530efb";
    sha256 = "sha256-FtK5vwia4G3B00m9Q5kKAuP+yGdUBkmqXXmIi8ig8pU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
