{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "f3e4e840703dfc81502dda3ff7f004685b1e4576";
    sha256 = "sha256-R0WMGKaKnUikaSn2hLUP/4EFku2mH8t9dMKVF5J9Pp0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
