{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "6ccb81893244be8b774adee05ab57fca0ad752eb";
    sha256 = "sha256-WtWmN6Sh23OgmK0lsw6l/MKo6vKGmZ6kb0hg7NCwYGM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
