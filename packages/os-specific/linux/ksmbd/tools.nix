{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "unstable-2023-11-09";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "8807bd2113905e1c919e7b9c039604798dd078c6";
    fetchSubmodules = true;
    sha256 = "sha256-1Htky39oggDqPYSbF4it2UMIxuoLp0aK+IjGojPgaiU=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
