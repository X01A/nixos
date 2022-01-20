{ source, fetchgit, lib, gcc8Stdenv, autoconf, automake, libtool, libev, autoreconfHook, ... }:

with lib;
gcc8Stdenv.mkDerivation rec {
  # inherit (source) pname version src;
  pname = "simple-obfs";
  version = "test-android";
  src = fetchgit {
    url = "https://github.com/shadowsocks/simple-obfs.git";
    rev = "0c6ea880a49d712aa85ef5fa3acaf9ddceb6c421";
    sha256 = "sha256-ZqfNrDlkF9464qeYCB8m+8J0twylMDt0E6XQZP51kT4=";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
  };

  configureFlags = [ "--disable-documentation" ];

  nativeBuildInputs = [ autoconf automake autoreconfHook ];
  buildInputs = [ libtool libev ];

  # MacOS support is broken
  meta.platforms = platforms.linux;
}
