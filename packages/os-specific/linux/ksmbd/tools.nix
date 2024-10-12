{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2024-10-12";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "48a97f3717e27717393c4771d59029aad0033db5";
    fetchSubmodules = true;
    sha256 = "sha256-rYQWYHXFPEuux3WsJNUQ4au5xHVvlNKlGUFwCio2giY=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
