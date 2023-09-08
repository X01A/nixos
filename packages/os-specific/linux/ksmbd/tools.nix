{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "unstable-2023-09-07";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "6f2abc2378c4bf0ebaa189580308de5f25a5e990";
    fetchSubmodules = true;
    sha256 = "sha256-H1onTRd50aH1N3Wtj3yIZSEkjgD6R2HaCibuaSIAS/g=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
