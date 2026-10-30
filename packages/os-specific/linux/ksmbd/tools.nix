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
  version = "0-unstable-2026-10-30";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "5cbc86530cea4eadb5ab77e03ca195e4f3914f77";
    fetchSubmodules = true;
    sha256 = "sha256-XdPRY9BXk32d5k25wD6tacAnm8CQOUo1G62Vd73IUZU=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
