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
  version = "0-unstable-2026-07-18";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "b8fb9e1bce4ba4b5f5efe18d648e3f7baa97ac23";
    fetchSubmodules = true;
    sha256 = "sha256-QCNo2T7VfldN9I/9CkJYxavLRurrv9q3rHIKIR7Z7rI=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
