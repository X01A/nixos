{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "feda9853464e2e78782d5e15d6155584ca762291";
    sha256 = "sha256-ppb4u1VfjfIJwUjoviWsPcKrSpvLEyNkHTBhV6RyOqw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
