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
  version = "0-unstable-2025-12-17";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "4d7d6c53f371861517c5158917a13fb09d96f143";
    fetchSubmodules = true;
    sha256 = "sha256-2p4wH8PfDgpKVXE8w0o1iobPEH079NFgUjNv/62qqzk=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
