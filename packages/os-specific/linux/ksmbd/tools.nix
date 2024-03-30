{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2024-03-29";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "cda9a352dc3323f47f3dff3d04416023a6a3f457";
    fetchSubmodules = true;
    sha256 = "sha256-2f3b6Znkj0UbjQn7tQbzfzW+k+B4J9TAzvoMC8aSOaw=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
