{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "cc538cd41f92d48b5ba5cdea35ebe6f7764ce78d";
    sha256 = "sha256-1hZvPTzL+9oHtci2LFuWz3d2SCNmuzmDUUBIo2YiSjM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
