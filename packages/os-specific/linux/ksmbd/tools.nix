{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2024-03-27";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "cb6f8cb0bb2e6413c7470b88dc67ba4b160f43ab";
    fetchSubmodules = true;
    sha256 = "sha256-k0FZYUmchqB1dJlBTZvhntOn91G2ax6YAp6l1t/FD00=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
