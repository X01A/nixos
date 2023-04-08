{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "unstable-2023-04-08";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "7294fd41fd8a4650ca91dcce7cec11d96072fbd6";
    fetchSubmodules = true;
    sha256 = "sha256-R/OWZekAGtDxE71MrzjWsdpaWGBu0c+VP0VkPro6GEo=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
