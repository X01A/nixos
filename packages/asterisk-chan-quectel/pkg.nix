{ stdenv, fetchFromGitHub, asterisk_23, autoconf, automake, sqlite, iconv, alsa-lib, ... }:

stdenv.mkDerivation rec {
  pname = "asterisk-chan-quectel";
  version = "3.5-unstable-2025-03-24";

  src = fetchFromGitHub {
    owner = "IchthysMaranatha";
    repo = pname;
    rev = "3d45c7f072131296a7e3c1a4faf5bb18751dbd87";
    fetchSubmodules = false;
    sha256 = "sha256-5Jq3CXkIvmNQN5FrWOeiCXhNcO4z58I2ryJ4BsGIxuA=";
  };

  preInstall = ''
    mkdir -p $out/lib/asterisk/modules/
  '';

  DESTDIR = "$(out)/lib/asterisk/modules/";

  preConfigure = ''
    ./bootstrap
  '';

  nativeBuildInputs = [ autoconf automake ];
  configureFlags = [
    "--with-astversion=23"
    "--with-asterisk=${asterisk_23}/include"
    "--with-iconv=${iconv.dev}/include"
  ];

  buildInputs = [ asterisk_23 sqlite iconv alsa-lib ];
}
