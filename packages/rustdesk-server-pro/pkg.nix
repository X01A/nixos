{
  fetchurl,
  stdenv,
  autoPatchelfHook,
}:

stdenv.mkDerivation rec {
  pname = "rustdesk-server-pro";
  version = "1.7.2";

  src = fetchurl {
    url = "https://github.com/rustdesk/rustdesk-server-pro/releases/download/${version}/rustdesk-server-linux-amd64.tar.gz";
    sha256 = "sha256-Etes5RMhZLwPo7c0746t4i9PGqnGhn/nR+MNKF9e3L4=";
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
    cp -r static $out/static
  '';
}
