{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7e5ccf45cd02044aed18f1bbe7f70795ffb25720";
    sha256 = "sha256-wRKvm3mzPTRSreS761D7+C4kNKhIiUXzFthTLXjEYDA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
