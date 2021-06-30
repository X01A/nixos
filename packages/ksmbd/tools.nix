{ lib, stdenv, fetchFromGitHub, autoreconfHook, glib, pkg-config, libnl }:

stdenv.mkDerivation {
  pname = "ksmbd-tools";
  version = "20210416";

  src = fetchFromGitHub {
    owner = "namjaejeon";
    repo = "ksmbd-tools";
    rev = "5a5ff7b021fdacc3bcfe645fd13a25d60302e00e";
    sha256 = "123dy29kwx9c0wcqyd9i9njvs2bablriq160421hy0ycvbkrd78g";
  };

  nativeBuildInputs = [ autoreconfHook glib pkg-config libnl ];
}
