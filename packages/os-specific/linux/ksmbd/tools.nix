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
  version = "0-unstable-2026-10-20";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "b2a5316f13e7df889b621799dfb271d1948e560a";
    fetchSubmodules = true;
    sha256 = "sha256-CtI9Iv9GPlQqRn1YJrdfeVMOjBOVE5DJ4QuRRem66sE=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
