{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "bcbb0d8c061a05efa4997f6600f1c11546289697";
    sha256 = "sha256-OIRjbAkGKw6BzdjV56U+CLT5hRGLF9Um39PzyaCub6U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
