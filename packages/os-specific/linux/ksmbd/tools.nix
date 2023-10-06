{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "unstable-2023-10-06";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "0eaca43404b2ab8c0cd2dfbebf0b597cfaa837bd";
    fetchSubmodules = true;
    sha256 = "sha256-RTjtQm2KJf6pjVMTffXXemrzjQroZxkxzWGNdMId99o=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
