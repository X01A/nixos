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
  version = "0-unstable-2026-11-12";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "bd24905147318ba3ee7e7c58180a928e51c6ff6e";
    fetchSubmodules = true;
    sha256 = "sha256-wghbmKlT7qG3V9bVnmkOMCIaJENV1kw+fmHw5skUUXE=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
