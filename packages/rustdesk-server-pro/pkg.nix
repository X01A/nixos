{
  fetchurl,
  stdenv,
  autoPatchelfHook,
}:

let
  version = "1.8.8";

  srcs = {
    x86_64-linux = {
      url = "https://github.com/rustdesk/rustdesk-server-pro/releases/download/${version}/rustdesk-server-linux-amd64.tar.gz";
      hash = "sha256-RCzqkDQgLxu+sqxe/lbbwAIqBgAzgjgQsa10Wv6eslI=";
    };
    aarch64-linux = {
      url = "https://github.com/rustdesk/rustdesk-server-pro/releases/download/${version}/rustdesk-server-linux-arm64v8.tar.gz";
      hash = "sha256-SIch1e+yeHKdBzQPX/Q1QZ9nSJt9DBkKXPB3aVR9hzA=";
    };
  };
in
stdenv.mkDerivation {
  pname = "rustdesk-server-pro";
  inherit version;

  src = fetchurl (
    srcs.${stdenv.system} or (throw "Unsupported system: ${stdenv.system}")
  );

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
