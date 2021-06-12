{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "leaf";
  version = "0.3.1";

  src = fetchurl {
    url = "https://github.com/eycorsican/leaf/releases/download/v${version}/leaf-x86_64-unknown-linux-musl.gz";
    sha256 = "UOW7fleDz40idmDKk4J/7B1fj9l2FXsREW3QGtTgLes=";
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
