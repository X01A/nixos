{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2024-12-04";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "1049fa91a1209ab53a1c2bdb97e809e07146e8b1";
    fetchSubmodules = true;
    sha256 = "sha256-f2B+24AboAWLIrtuHWn8YMEPzWahIafc3kfx0zKyz8g=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
