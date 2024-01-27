{ fetchurl, stdenv, autoPatchelfHook, buildPhase ? "", ... }:

stdenv.mkDerivation rec {
  # inherit (source) pname version src;
  pname = "teleport-ent";
  version = "14.3.3";

  src = fetchurl {
    url = "https://cdn.teleport.dev/teleport-ent-v${version}-linux-amd64-bin.tar.gz";
    sha256 = "sha256-73IhB6KrLrO74SZfyYfl9fXyQ6fFvcwgmGWuHLS8b1E=";
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
