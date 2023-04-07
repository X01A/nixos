{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "unstable-2023-04-07";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "ac962fbe2c09940a17a32c2b6e0ff947965cdc54";
    fetchSubmodules = true;
    sha256 = "sha256-NQ1D7p6+L+M3hXDqwTmcu2JKXNLkfsQjy3dgdQbHUwA=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
