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
  version = "0-unstable-2026-05-04";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "dc2148953867bae2b27081ec27bccca68c9566f3";
    fetchSubmodules = true;
    sha256 = "sha256-jtd8dl9cBHZByOgHEam84gp+s0XFfxbaaBe+9y1rWNU=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
