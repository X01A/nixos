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
  version = "0-unstable-2026-10-25";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "f3b3cfb927b134636ff8606d8a7dc7b51146b862";
    fetchSubmodules = true;
    sha256 = "sha256-REiMDF+aXrrAKLlWMm3weCi+8xy1qspt1B6lQ6cS/3I=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
