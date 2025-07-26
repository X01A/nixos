{ fetchurl, stdenv, autoPatchelfHook }:

stdenv.mkDerivation rec {
  name = "rustdesk-server-pro";
  version = "1.6.2";

  src = fetchurl {
    url = "https://github.com/rustdesk/rustdesk-server-pro/releases/download/${version}/rustdesk-server-linux-amd64.tar.gz";
    sha256 = "sha256-W94DlgFwfntGW2ZUKM2FivT80fs380C7/uEVC8q5vSw=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    stdenv.cc.cc.lib
  ];

  buildPhase = ":";

  installPhase = ''
    mkdir -p $out/bin
    cp hbbr $out/bin
    cp hbbs $out/bin
    cp rustdesk-utils $out/bin
  '';
}
