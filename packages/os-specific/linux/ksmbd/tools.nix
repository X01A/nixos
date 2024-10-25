{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2024-10-24";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "27268fd7c13bee4a0bf788e0e40eafeff75e4eff";
    fetchSubmodules = true;
    sha256 = "sha256-aOLrQBxsCqbyX8iNcr+Ex2EBZ8mc7HARExqXtmmwLY8=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
