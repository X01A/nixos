{ stdenv, fetchFromGitHub, asterisk_18, autoconf, automake, sqlite, iconv, alsa-lib, ... }:

stdenv.mkDerivation rec {
  pname = "asterisk-chan-quectel";
  version = "unstable-2022-09-08";

  src = fetchFromGitHub {
    owner = "IchthysMaranatha";
    repo = pname;
    rev = "b3534eaedce52819ee3f61db6d191ed35177b955";
    fetchSubmodules = false;
    sha256 = "sha256-vLKqGOsc2HsLGy7JtkW0ttc6Om4mzMhG5AXjkc9ES7s=";
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
    "--with-astversion=18"
    "--with-asterisk=${asterisk_18}/include"
    "--with-iconv=${iconv.dev}/include"
  ];

  buildInputs = [ asterisk_18 sqlite iconv alsa-lib ];
}
