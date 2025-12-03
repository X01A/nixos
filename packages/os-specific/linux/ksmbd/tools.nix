{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2025-12-03";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "3dcf2ddce4db395a3033a5b1b159d03fb2767032";
    fetchSubmodules = true;
    sha256 = "sha256-JwfxYFBwrMtP2D7GcDpW44WYbLJyxZy3Jhgi+7HsIng=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
