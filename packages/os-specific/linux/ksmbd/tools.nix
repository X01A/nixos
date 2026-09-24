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
  version = "0-unstable-2026-09-23";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "47cf674a0c66372472f1503a64fd1324d8b6a366";
    fetchSubmodules = true;
    sha256 = "sha256-1e+3i4ysUKkbkvyzjid0k8EEWw6DJT7pt3mnznCyzD4=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
