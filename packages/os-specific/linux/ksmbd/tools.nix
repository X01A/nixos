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
  version = "0-unstable-2026-10-27";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "e1e39eb2b7e80b9ab40334e779149e23b2b447e4";
    fetchSubmodules = true;
    sha256 = "sha256-ILGVEA0y6+g1O1BuTUXWdrB6AKYi66piigApK0iQTLM=";
  });

  nativeBuildInputs = [
    autoreconfHook
    glib
    pkg-config
    libnl
  ];
}
