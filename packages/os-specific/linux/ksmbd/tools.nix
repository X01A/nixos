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
  version = "0-unstable-2026-07-19";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "ce9cb3f31798ce952a6dc91c93cf9778ff74968d";
    fetchSubmodules = true;
    sha256 = "sha256-9+9ty9g568yVSM+kiww+4YmH9whmW2MtcrOnwuxAxAQ=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
