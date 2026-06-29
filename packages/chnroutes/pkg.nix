{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "35857f2c8498a8a3b6c166f03051541099f49b19";
    sha256 = "sha256-rvhPuftA+jw6I7I4jIXm85auJHEzO16xihFmtwiAV2Q=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
