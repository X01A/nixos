{ fetchurl, stdenv }:

stdenv.mkDerivation rec {
  pname = "clash-premium";
  version = "2023.03.03";
  src = fetchurl {
    url = "https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-${version}.gz";
    sha256 = "sha256-utvuXEv3hqUSnzHjBVNMCTxGSk8ck5w0dpyR6k9j/w0=";
  };

  unpackPhase = ":";

  installPhase = ''
    mkdir -p $out/bin

    cp $src $out/bin/clash.gz
    gunzip $out/bin/clash.gz
    chmod +x $out/bin/clash
  '';
}
