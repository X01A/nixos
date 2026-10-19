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
  version = "0-unstable-2026-10-18";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "4f8fc5c0bbd8e21753de724f5fe2bdd3bd198097";
    fetchSubmodules = true;
    sha256 = "sha256-HOZmJyjKQ0AATqFZCyDh+2SFxph5loik31APM2STDYA=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
