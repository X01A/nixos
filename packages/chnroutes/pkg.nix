{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-31";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "6139b6d85ae3d33b5d1d721463a3f643cf77364a";
    sha256 = "sha256-nAHReCvssj6qB5iekver7EBZg+EFwwBnFmwMXupg2sQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
