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
  version = "0-unstable-2026-06-22";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "1f23ebb0e84768b3967820ebbfc49406168df1dc";
    fetchSubmodules = true;
    sha256 = "sha256-mUvftJ0d9LCRDjgfnUU3XYM3bjq/NtACfHlPXRFYvzw=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
