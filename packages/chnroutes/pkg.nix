{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "6ea36d46bb8fc56ff367bfa9cff491b08c944bfc";
    sha256 = "sha256-G58q8XJjv3eQxvWiLvZltEZCJBAjeOL9CbJKpH3GRW4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
