{ stdenv, autoPatchelfHook, fetchzip, ... }:

stdenv.mkDerivation rec {
  # inherit (source) pname version src;
  pname = "hpool-x-proxy";
  version = "1.0.8-1";

  src = fetchzip {
    url = "https://github.com/hpool-dev/arweave-miner/releases/download/v2.0.0/xproxy-ar-v1.0.8-1.zip";
    sha256 = "sha256-2keWc9vTFYSem0Gab0A0g+CYoodI7DIeeV52dzECKhU";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    stdenv.cc.cc.lib
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp x-proxy-ar-linux-amd64 $out/bin/x-proxy
  '';
}
