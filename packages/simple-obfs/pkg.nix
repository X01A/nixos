{
  fetchgit,
  lib,
  stdenv,
  autoconf,
  automake,
  libtool,
  libev,
  autoreconfHook,
}:

with lib;
stdenv.mkDerivation rec {
  pname = "simple-obfs";
  version = "0.0.5-unstable-2019-08-17";
  src = fetchgit {
    url = "https://github.com/shadowsocks/simple-obfs.git";
    rev = "486bebd9208539058e57e23a12f23103016e09b4";
    sha256 = "sha256-eyVRec9V2qM/9XL+SZCuTXkD3qbbGMjTL/kDsAzwl9c=";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
  };

  configureFlags = [ "--disable-documentation" ];

  # gcc 16 promotes "discards 'const' qualifier" to an error, and this
  # unmaintained 2019 snapshot assigns a const char* to a non-const one
  # in jconf.c.
  env.NIX_CFLAGS_COMPILE = "-Wno-error=discarded-qualifiers";

  nativeBuildInputs = [
    autoconf
    automake
    autoreconfHook
  ];
  buildInputs = [
    libtool
    libev
  ];

  # MacOS support is broken
  meta.platforms = platforms.linux;
}
