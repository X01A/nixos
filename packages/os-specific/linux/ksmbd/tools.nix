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
    rev = "ca52b8d7be7544aff4e9cc4b8c27c192ec39b881";
    fetchSubmodules = true;
    sha256 = "sha256-lLUGEm2PQ8Q8Pp5m79W4hx2cEOei54y9dzKCiBuv3bs=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
