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
  version = "0-unstable-2026-05-10";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "e52d332a054d5dbe3ee71127e60e433acc26ca57";
    fetchSubmodules = true;
    sha256 = "sha256-1hdqxwQr9psw4Pp9+Fj9ORZdHE+EMt1duGMw03/U7PY=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
