{ fetchurl, stdenv, autoPatchelfHook }:

stdenv.mkDerivation rec {
  name = "rustdesk-server-pro";
  version = "1.7.1";

  src = fetchurl {
    url = "https://github.com/rustdesk/rustdesk-server-pro/releases/download/${version}/rustdesk-server-linux-amd64.tar.gz";
    sha256 = "sha256-boz75grnb7W2fY2VQxvWraHH52OIbkrS347KjB/aSYw=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    stdenv.cc.cc.lib
  ];

  buildPhase = ":";

  installPhase = ''
    mkdir -p $out/bin
    cp hbbr $out/bin
    cp hbbs $out/bin
    cp rustdesk-utils $out/bin
    cp -r static $out/static
  '';
}
