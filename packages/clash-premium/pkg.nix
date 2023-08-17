{ fetchurl, stdenv }:

stdenv.mkDerivation rec {
  pname = "clash-premium";
  version = "2023.08.17";
  src = fetchurl {
    url = "https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-${version}.gz";
    sha256 = "sha256-kjgPBT8IPjeUwWgVg74BOlexYCktHZ4QVuf6HC2Uh0c=";
  };

  unpackPhase = ":";

  installPhase = ''
    mkdir -p $out/bin

    cp $src $out/bin/clash.gz
    gunzip $out/bin/clash.gz
    chmod +x $out/bin/clash
  '';
}
