{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2024-06-21";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "d1e8af1a8050b63e622ab1ea05098a8b603b4f8e";
    fetchSubmodules = true;
    sha256 = "sha256-ac0bZWbjLc1s2Fk3ZxkZvdxlHcvwrjWveQR1ksNWlDM=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
