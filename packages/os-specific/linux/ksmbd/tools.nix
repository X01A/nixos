{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "unstable-2023-09-17";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "98c5d20f3c7e60ff58918edaf2e232e3d862138e";
    fetchSubmodules = true;
    sha256 = "sha256-wnv9ET5LB1JUL1RpcWacTCMhhzIPUpJQER42u3f4MXg=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
