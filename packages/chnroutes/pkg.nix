{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "9f4b986ed6f6a62a0101d84d32a52c561bbfbb3e";
    sha256 = "sha256-FPadsN69QedJ0pIlE5am/UrBaLcSgui346Egh7AnpqQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
