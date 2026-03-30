{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "3c8082de8fb19e17fa91ed49765b216ebb3878cd";
    sha256 = "sha256-W7NQ8GVevjwGvq7LwaHKv3MgRZlYZneavGSW2ymrleY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
