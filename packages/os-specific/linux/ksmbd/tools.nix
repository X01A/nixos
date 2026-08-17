{
  lib,
  stdenv,
  fetchFromGitHub,
  autoreconfHook,
  glib,
  pkg-config,
  libnl,
}:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2026-08-16";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "82eb9a55996d51ae8307994fdb9f99fca7d55503";
    fetchSubmodules = true;
    sha256 = "sha256-K5LTeuvX/k+EOexLWnWW8jg6QW5Qt3dckG5Zt9boO8c=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
