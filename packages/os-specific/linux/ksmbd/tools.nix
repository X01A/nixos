{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "unstable-2023-10-30";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "c4f35c75fc19e2bf42b50f4b2e0e53537017a80d";
    fetchSubmodules = true;
    sha256 = "sha256-8mjfKCazigHnuN7Egf11ZuD+nQx7ZTesn0a4LsVvV/M=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
