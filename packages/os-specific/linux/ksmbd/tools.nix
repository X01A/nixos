{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2025-01-10";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "69e4ff7ddb7623deea67758a98279f39ae9289b7";
    fetchSubmodules = true;
    sha256 = "sha256-S8OA8xqQ+DTBKfYnxRM5MCx09i66V2nFp5JhhJtwAlU=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
