{ source, stdenv, pkg-config, cmake, ffmpeg, boost169, openssl, libX11, libopus, xorg, libpulseaudio, libevdev, rsync }:

let
  boostStatic = boost169.override {
    enableShared = false;
    enabledStatic = true;
  };
in
stdenv.mkDerivation rec {
  inherit (source) pname version src;

  # Fix Boost static libs and libevdev
  postPatch = ''
    substituteInPlace CMakeLists.txt --replace "set(Boost_USE_STATIC_LIBS ON)" ""
    substituteInPlace CMakeLists.txt --replace \
      '/usr/include/libevdev-1.0' \
      "$(pkg-config --cflags libevdev | cut -c 3-)"
  '';

  cmakeFlags = [
    "-D SUNSHINE_ASSETS_DIR=${placeholder "out"}/assets"
  ];

  # Fix error: -Wformat-security ignored without -Wformat
  hardeningDisable = [ "format" ];
  buildInputs = [
    rsync
    ffmpeg
    boostStatic
    openssl
    libX11
    libopus
    libpulseaudio
    libevdev
    xorg.libXtst
    xorg.libXfixes
    xorg.libXrandr
    xorg.libxcb
    xorg.libXi
  ];
  nativeBuildInputs = [ cmake pkg-config ];

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/assets
    install -m 755 sunshine $out/bin

    rsync -Er --chmod u+w ../assets/ $out/assets
  '';
}
