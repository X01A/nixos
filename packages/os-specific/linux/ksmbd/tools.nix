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
  version = "0-unstable-2026-11-08";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "8c5f91d2d804fff936842c9801da88886a2a4366";
    fetchSubmodules = true;
    sha256 = "sha256-6We41Xt81Bof8ZXV92V/s5La0DJ8C79idI3uXk5cMZM=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
