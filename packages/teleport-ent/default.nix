{ fetchurl, stdenv, autoPatchelfHook, buildPhase ? "", ... }:

stdenv.mkDerivation rec {
  # inherit (source) pname version src;
  pname = "teleport-ent";
  version = "8.0.0";

  src = fetchurl {
    url = "https://get.gravitational.com/teleport-ent-v8.0.0-linux-amd64-bin.tar.gz";
    sha256 = "0gabah8q460ydjrqg5z16n0ar5diz69g03ccqshfdz298ad39g3q";
  };

  inherit buildPhase;

  nativeBuildInputs = [
    autoPatchelfHook
    stdenv.cc.cc.lib
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp {tctl,teleport,tsh} $out/bin
  '';
}
