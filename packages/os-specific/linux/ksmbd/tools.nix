{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2024-10-18";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "86d134282261b58b7b4a6e358fe24cbe704b7c71";
    fetchSubmodules = true;
    sha256 = "sha256-M13PExyEDH3FtTN5J9GVtVl4VdTsPlHYTOw/UIDqV1c=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
