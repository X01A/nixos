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
  version = "0-unstable-2026-07-29";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "304c447029f700a849332b7c52b3df4030a6c66b";
    fetchSubmodules = true;
    sha256 = "sha256-mShg2M403BHcaXJTnYCV5J/fXk0C2HMv9UOIFpszL4s=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
