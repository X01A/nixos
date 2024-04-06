{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2024-04-05";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "e4662a0ae1a36847be84a9d84afd7399e5c95ccb";
    fetchSubmodules = true;
    sha256 = "sha256-QE/Pnba4zgeInlVqOEjT3EqV6NPkQTp6xeYU3dsIl4M=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
