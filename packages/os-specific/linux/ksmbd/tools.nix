{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2024-09-14";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "f5173cbf643907e0d5e9d6da88b9a081b097fe84";
    fetchSubmodules = true;
    sha256 = "sha256-qaLfOiuzj99sdONahiq+Z00pwiZcGDwhbzKNT01Y+hU=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
