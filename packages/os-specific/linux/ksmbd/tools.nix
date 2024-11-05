{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2024-11-04";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "0dd8f15dffc1678c175aac466cc7a8f3ce0aa86c";
    fetchSubmodules = true;
    sha256 = "sha256-sIuJue7UBQccE2SUWKkL80+Zm2pMoB7Mm1fGmvaJWfY=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
