{ lib
, stdenv
, fetchFromGitHub
, cmake
, nlohmann_json
, openssl
,
}:

stdenv.mkDerivation {
  pname = "mlspp";
  version = "0.1.0-unstable-2026-09-21";

  src = fetchFromGitHub {
    owner = "cisco";
    repo = "mlspp";
    rev = "fc724c3100ce3b5d8565dbd6d93648a440991a8c";
    hash = "sha256-N6s35lrRpR8Zu/cJXqL8lePYqdbJLeyz82ZAbOVGB1M=";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [
    nlohmann_json
    openssl
  ];

  cmakeFlags = [
    "-DDISABLE_GREASE=ON"
    "-DMLS_CXX_NAMESPACE=mlspp"
    "-DTESTING=OFF"
  ];

  postPatch = ''
    substituteInPlace CMakeLists.txt \
      --replace-fail "-Werror" ""
  '';

  meta = {
    description = "Messaging Layer Security protocol implementation";
    homepage = "https://github.com/cisco/mlspp";
    license = lib.licenses.bsd2;
  };
}
