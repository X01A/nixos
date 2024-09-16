{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2024-09-15";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "78bef66b7c653f353f82b96a330945f4fc198db6";
    fetchSubmodules = true;
    sha256 = "sha256-yBhiieNiVA36KXDJu4aRkloQQZ7OlmWMcBE1hcv/SNY=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
