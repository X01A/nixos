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
  version = "0-unstable-2026-07-24";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "f934184e354073ef8b47567c7794482f06817d5c";
    fetchSubmodules = true;
    sha256 = "sha256-rTjV7PuUeqRJMki04jDuAA/tTAV6mcBJUN+F5a5t0CA=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
