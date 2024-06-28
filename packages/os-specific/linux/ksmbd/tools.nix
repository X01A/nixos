{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2024-06-27";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "549ec0eb3728a8c6852b80c3eb9303e20b7c1d52";
    fetchSubmodules = true;
    sha256 = "sha256-QKppS7k9gaZse0PsDsavnR82ztsud8A8f8wTDbO3V2w=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
