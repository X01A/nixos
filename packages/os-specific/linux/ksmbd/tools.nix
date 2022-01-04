{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl, source }:

stdenv.mkDerivation {
  inherit (source) pname version src;

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
