{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "92b01ec5d90ba737c38084604259c83b3b239fed";
    sha256 = "sha256-aJAw/nCidx5RPkQduTOIAYosdlsECUfCWPffUmmUR6I=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
