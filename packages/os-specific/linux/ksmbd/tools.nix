{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "unstable-2023-07-21";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "33a0900b61a62fa2ac6d6dd27c3a86a4d26d1f98";
    fetchSubmodules = true;
    sha256 = "sha256-49n8Ed8xN/9CRfRQ/zUiAcG3SWemvqhwKM20za91u74=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
