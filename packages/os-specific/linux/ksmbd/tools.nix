{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "unstable-2024-01-13";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "a5f07fa170bbe7a7d8be2abb8cd26d9580a37bdf";
    fetchSubmodules = true;
    sha256 = "sha256-d/5UQJTNsoHbd0j+8+grmkPH+/z7+xHcl8TxOR5uN4k=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
