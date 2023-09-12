{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "unstable-2023-09-11";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "e012ed8d65794490357138c95e8ba2b4231c221d";
    fetchSubmodules = true;
    sha256 = "sha256-tr6+QGiE+G5ij+sv9ntGsDRyW/V2o+LuHsnLGbxO4SU=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
