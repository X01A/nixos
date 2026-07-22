{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "18a4141f98c86caa50bdc498f94b0ca935148b5f";
    sha256 = "sha256-rVPpPhLscYQJ6vKj6z2AVuwDuELsLHRAdtIYJAOwvTI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
