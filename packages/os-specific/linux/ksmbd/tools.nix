{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2024-10-19";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "56bb94b0cdd765310880907c960df8be4e78158f";
    fetchSubmodules = true;
    sha256 = "sha256-vDpEHxvzGGQMQiZ5S7hUcTa91lDizFOHEjxytRAyH5o=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
