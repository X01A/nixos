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
  version = "0-unstable-2026-07-10";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "82ddb570eedcb5bf447e63e3317e1ada8fd215f1";
    fetchSubmodules = true;
    sha256 = "sha256-HnSqNoj35QzX1QPj2s1O+LY0NiEqSEqp+01dVNg+GcM=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
