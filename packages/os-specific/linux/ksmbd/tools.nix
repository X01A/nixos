{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2024-09-11";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "f374561990f85fbccd9f906eba7b9477935e6054";
    fetchSubmodules = true;
    sha256 = "sha256-dtyegloUmpXSM4UXR0nUKTbKW/latXR3yBzBl4bzKN8=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
