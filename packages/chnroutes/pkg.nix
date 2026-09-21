{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "0f6413e640cba550a952adaa974a392a545c4a58";
    sha256 = "sha256-TctEljFjqznldXRf8s3GJ2TGBqRIkW2wkdo/uWu6Ark=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
