{ source, stdenv }:

stdenv.mkDerivation rec {
  inherit (source) src pname version;

  unpackPhase = ":";

  installPhase = ''
    mkdir -p $out/bin

    cp $src $out/bin/clash.gz
    gunzip $out/bin/clash.gz
    chmod +x $out/bin/clash
  '';
}
