{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "f500fccb8738ad68667e1c4153424f9a0a4b71a8";
    sha256 = "sha256-srRs8rGx6/ST6SvagwXJLdybA8yyzpdmmqesZMW7N/g=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
