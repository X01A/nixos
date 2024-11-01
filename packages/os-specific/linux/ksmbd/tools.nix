{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2024-10-31";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "06ccd32bc4195fa9ddc7a8cd1bd8e845c5dd014f";
    fetchSubmodules = true;
    sha256 = "sha256-nnXmkTT8/5+WUXiC7rxtQMk3Iqzi3LZSL6W5t35ZNB8=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
