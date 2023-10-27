{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "unstable-2023-10-26";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "d2f0b56e3a7bedca758b89bd57cdbaaba4e0bb66";
    fetchSubmodules = true;
    sha256 = "sha256-LsVjDLTgy6lEIz7zR6JIbY57bq0T2sFrq7yCExorC1U=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
