{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2025-01-20";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "1025a9846a99c8e50d73a3fff4bf958fa0a8a852";
    fetchSubmodules = true;
    sha256 = "sha256-Mw8neMAEeZCBdHv/B3Vvu0MKpdgK6Tq3+INeJDH5oNM=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
