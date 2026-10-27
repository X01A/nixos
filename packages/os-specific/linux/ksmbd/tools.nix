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
  version = "0-unstable-2026-10-26";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "9c398b6f6517a3290844cebd22616ea0f631c0c0";
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
