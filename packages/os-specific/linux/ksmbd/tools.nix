{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2025-12-01";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "ac065098cf39c3c54570332a8a4da09711e469a5";
    fetchSubmodules = true;
    sha256 = "sha256-WUPyw0wF7B+Ti/cGgJZrp57E7T5MGUxY1nLinN9KWdQ=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
