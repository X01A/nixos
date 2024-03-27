{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2024-03-26";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "7448e6db08f69949406328af682b1d4f07de9549";
    fetchSubmodules = true;
    sha256 = "sha256-+CjdXl5nXCjhsnaxqCVfsyhNVM+zmrFWV7jCA2t9Vt0=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
