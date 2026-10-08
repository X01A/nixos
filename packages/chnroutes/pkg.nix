{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "2288920eb9f62472f99cde2ce96cb37d1ca2e941";
    sha256 = "sha256-d9ZbnFdqsdMc+MHKwnjYEbmXHqoB3jSEXUFClJvQMEs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
