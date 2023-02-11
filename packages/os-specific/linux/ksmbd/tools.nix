{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "unstable-2023-01-31";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "85a066e37d48b5f673c9e8dd562cb806000590d6";
    fetchSubmodules = true;
    sha256 = "sha256-uYJhjxarAqJC/aY8UUy7sjhA89LVoCG6B7/APkE0ouk=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
