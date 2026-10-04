{
  fetchurl,
  stdenv,
  autoPatchelfHook,
}:

stdenv.mkDerivation rec {
  pname = "rustdesk-server-pro";
  version = "1.8.7";

  src = fetchurl {
    url = "https://github.com/rustdesk/rustdesk-server-pro/releases/download/${version}/rustdesk-server-linux-amd64.tar.gz";
    sha256 = "sha256-4ZR3lqNGy6OeURDmIbqEkKdZdVpGoD92so97EBEWTjc=";
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
