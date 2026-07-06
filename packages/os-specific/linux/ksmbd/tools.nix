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
  version = "0-unstable-2026-07-05";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "dca2f16ede7426dcfa4d6fc89295e31e6ffb2f06";
    fetchSubmodules = true;
    sha256 = "sha256-J7itZw1PCmVPB3MU5NQZtYC+iuAkiQXWkxzD8URV7V4=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
