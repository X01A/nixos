{ fetchgit, lib, gcc8Stdenv, autoconf, automake, libtool, libev, autoreconfHook }:

with lib;
gcc8Stdenv.mkDerivation rec {
  pname = "simple-obfs";
  version = "unstable-2019-08-17";
  src = fetchgit {
    url = "https://github.com/shadowsocks/simple-obfs.git";
    rev = "486bebd9208539058e57e23a12f23103016e09b4";
    sha256 = "sha256-eyVRec9V2qM/9XL+SZCuTXkD3qbbGMjTL/kDsAzwl9c=";
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
