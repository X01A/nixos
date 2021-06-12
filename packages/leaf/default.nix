{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "leaf";
  version = "0.3.1";

  src = fetchurl {
    url = "https://github.com/eycorsican/leaf/releases/download/v${version}/leaf-x86_64-unknown-linux-musl.gz";
    sha256 = "1ska44cfgm1hajb12f64xglp539kk3i3g7455q7flz9pwbc554i4";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p "$out"/bin/
    cp $src $out/leaf.gz
    gunzip $out/leaf.gz
    install -m 755 $out/leaf -t "$out"/bin/
    rm -f $out/leaf
  '';
}
