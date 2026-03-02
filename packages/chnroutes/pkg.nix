{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "1e73e941a2069ff19354cf2df7301b14a4c8c355";
    sha256 = "sha256-59vhA0eCU/BcMldP3+F+O0SYMk07g+SEcfaCSlGx0+E=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
