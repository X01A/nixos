{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "6bff9e2c217c64b7eabc4f12930b1ce5b2e0ed1b";
    sha256 = "sha256-lJdvxjH/ZE7QY0RyKBnK6hfnjiQ4fKpUteBw11EgCv8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
