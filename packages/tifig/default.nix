{ source, stdenv, pkg-config, cmake, vips, ffmpeg }:

stdenv.mkDerivation rec {
  inherit (source) pname version src;

  buildInputs = [ vips ffmpeg ];
  nativeBuildInputs = [ cmake pkg-config ];

  installPhase = ''
    mkdir -p $out/bin
    install -m 755 tifig $out/bin
  '';
}
