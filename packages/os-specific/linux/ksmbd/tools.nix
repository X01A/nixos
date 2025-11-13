{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2025-10-23";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "4c6fed8604c6eacc924ca43a071cac9e1e2ad595";
    fetchSubmodules = true;
    sha256 = "sha256-eQFI3uJvqLYdWXB2I+syPKYS0gFEA+9o/bxpf8PqT3w=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
