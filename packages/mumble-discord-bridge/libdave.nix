{ lib
, stdenv
, fetchFromGitHub
, cmake
, pkg-config
, mlspp
, nlohmann_json
, openssl
,
}:

stdenv.mkDerivation rec {
  pname = "libdave";
  version = "1.1.1";

  src = fetchFromGitHub {
    owner = "discord";
    repo = pname;
    rev = "v${version}/cpp";
    hash = "sha256-ALDmtAjSkjnLDcmtpvcwiN7dPvpOgOTNFolr/H3SqsE=";
  };

  sourceRoot = "source/cpp";

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  buildInputs = [
    mlspp
    nlohmann_json
    openssl
  ];

  cmakeFlags = [
    "-DBUILD_SHARED_LIBS=ON"
    "-DPERSISTENT_KEYS=OFF"
    "-DTESTING=OFF"
  ];

  postInstall = ''
    mkdir -p $out/lib/pkgconfig
    cat > $out/lib/pkgconfig/dave.pc <<EOF
    prefix=$out
    libdir=\''${prefix}/lib
    includedir=\''${prefix}/include/dave

    Name: dave
    Description: Discord Audio and Video End-to-End Encryption protocol
    Version: ${version}
    Libs: -L\''${libdir} -ldave
    Cflags: -I\''${includedir}
    EOF
  '';

  meta = {
    description = "Discord Audio and Video End-to-End Encryption protocol";
    homepage = "https://github.com/discord/libdave";
    license = lib.licenses.mit;
  };
}
