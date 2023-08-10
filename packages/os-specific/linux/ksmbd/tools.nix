{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "unstable-2023-08-10";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "235f6847c1ec6adfe74270998ceea3a1d38de650";
    fetchSubmodules = true;
    sha256 = "sha256-/LYZNVxD36L+Wqwhup7HB0jTo5z4LvkjbjiguOD9XtE=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
