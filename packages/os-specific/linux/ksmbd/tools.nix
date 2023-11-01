{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "unstable-2023-10-31";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "8806acc0e6b2b18669b0ea6aa29d07eb92cbae2e";
    fetchSubmodules = true;
    sha256 = "sha256-AKm2Z1Z0NYvlcyH9+PczSWr9qecxSlDbBmPXWlglmpw=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
