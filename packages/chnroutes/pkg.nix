{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "02bb706c345daed343f5c76f29803c2c4a20f74f";
    sha256 = "sha256-U7nEQp7bLVjLlSRT8rqCV24gJEyGD5l1MHTVzILOn1w=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
