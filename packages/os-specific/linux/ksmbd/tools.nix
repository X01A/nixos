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
  version = "0-unstable-2026-10-22";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "4d9e5f488c4858e50394939e78ee0c2d289e6776";
    fetchSubmodules = true;
    sha256 = "sha256-++CjS4T7syMx9QhYWGrxkuV8WS2yWJLAhtSV0K8ma4c=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
