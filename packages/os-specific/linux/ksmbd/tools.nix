{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "0-unstable-2025-01-09";
  src = fetchFromGitHub ({
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "863d292893ddacf6d2091c29ba88a436745928e5";
    fetchSubmodules = true;
    sha256 = "sha256-oVQlbf1zafCsU8ycLQfr3BOMZZtgWP3aveVEF/If+yo=";
  });

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
