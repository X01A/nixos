{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "unstable-2023-10-18";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "a74c97761c42883d387dc218bbdad56a9c1a4353";
    fetchSubmodules = true;
    sha256 = "sha256-WoI1pha1YEIav/3mi5yRlp7S3Pec0yNdNvpBeLY5c/M=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
