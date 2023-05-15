{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "unstable-2023-05-14";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "c1386a4bec304719467383e2bcc6140833329818";
    fetchSubmodules = true;
    sha256 = "sha256-HRC9nrc16km1sO7m1bjnejRyfXTHD636/hUk48yQz3s=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
