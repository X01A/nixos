{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2024-10-28";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "5e1a47c3226df42848715ede5bd00648337d9680";
    fetchSubmodules = true;
    sha256 = "sha256-+uhoIk/J99eoTheI8mb3LkhowB7qkVQ+fOwH9IO9SlI=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
