{ fetchurl, stdenv }:

stdenv.mkDerivation rec {
  pname = "clash-premium";
  version = "2023.06.30";
  src = fetchurl {
    url = "https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-${version}.gz";
    sha256 = "sha256-AZKbYp5/DXB8LnkX2Xvr8xyuRvRy+DjKDZ6GpR84//U=";
  };

  unpackPhase = ":";

  installPhase = ''
    mkdir -p $out/bin

    cp $src $out/bin/clash.gz
    gunzip $out/bin/clash.gz
    chmod +x $out/bin/clash
  '';
}
