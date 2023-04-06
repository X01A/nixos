{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "unstable-2023-04-06";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "044699ac5f688111747dbf021570a1602834a4cf";
    fetchSubmodules = true;
    sha256 = "sha256-R4yTqofrxTc3PTxxSwkjFeUREJ+wFy+uqnOoZlryDDI=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
