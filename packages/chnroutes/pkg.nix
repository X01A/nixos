{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "b9e9bf0dff97244ef25259199153007d23599bd8";
    sha256 = "sha256-si/pVKxSXGhfqxqKyOJEFRo9kD6nCQlc1UFY/dqge+Q=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
