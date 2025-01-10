{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2025-01-10";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "8a3caf32450f9247c598f7b9305e44aa067b5e1a";
    fetchSubmodules = true;
    sha256 = "sha256-hJgngEnZRYsQ3lwYXj1EvE1lyBF2QPaef1s9gUIqDFg=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
