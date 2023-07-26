{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "unstable-2023-07-25";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "ff12dcc182e0bab9f147e2ff426d866066f6fed1";
    fetchSubmodules = true;
    sha256 = "sha256-GZccOlp9zZMqtv3+u8JnKFfIe8sjwbZBLkDk8lt3CGk=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
