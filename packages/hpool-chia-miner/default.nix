{ stdenv, fetchzip }:

stdenv.mkDerivation rec {
  pname = "hpool-chia-miner";
  version = "1.4.0-2";

  src = fetchzip {
    url = "https://github.com/hpool-dev/chia-miner/releases/download/v${version}/HPool-Miner-chia-v${version}-linux.zip";
    sha256 = "N6cE8dl+2gsNsxXL9osXfDsdM4yMQ+m0r862eAGfkAA=";
    stripRoot = false;
  };

  installPhase = ''
    mkdir -p $out
    cp -r linux $out/bin
    chmod +x $out/bin/*
  '';
}
