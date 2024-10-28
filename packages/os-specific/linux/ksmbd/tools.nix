{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2024-10-28";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "0946beb021766fae0d825ef6a7c1250a5958306f";
    fetchSubmodules = true;
    sha256 = "sha256-iha9Pgrl+C8shtfWnyNS4vKRQN8gStyB9qMjb4gqOLM=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
