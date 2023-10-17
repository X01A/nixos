{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "unstable-2023-10-16";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "fb5e7a91b6eca7e40d2df0aeb7283351d848d2c4";
    fetchSubmodules = true;
    sha256 = "sha256-XOapQS0I0gPcAz1TyVh7iKsiveSGgDEf2aLHUUBCTyw=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
