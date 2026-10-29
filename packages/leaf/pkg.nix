{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  pname = "leaf";
  version = "0.14.2";

  src = fetchurl {
    url = "https://github.com/eycorsican/leaf/releases/download/v${version}/leaf-x86_64-unknown-linux-musl.gz";
    sha256 = "sha256-jul8+xuQ0or5Xzj4g0iAsCg35ATcq2PSFor8mWwrl3I=";
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
