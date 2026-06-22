{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "89aa6c92f3cb36bb5191cd4ea516268cc2255b50";
    sha256 = "sha256-FrGPyi2d8T1gi+blHuzCwa14jbqiqrmoPMVeq1pwl8Q=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
