{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "unstable-2023-11-12";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "7b3e975528cb9095114cd7713fee8dcb3e5229d6";
    fetchSubmodules = true;
    sha256 = "sha256-FmbWdfb4mAQMgWpUP+IQmbvIvRdW+7Oj1iiOYryoXT0=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
