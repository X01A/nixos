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
  version = "0-unstable-2026-09-22";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "f02f65a1b400e6682932c9d2adc812f14a7db661";
    fetchSubmodules = true;
    sha256 = "sha256-Jwlo5AwHWxMkx+pAX0aPRtPh0TqL8KOg41jLQGYRklA=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
