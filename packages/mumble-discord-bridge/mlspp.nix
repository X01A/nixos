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
  version = "0.1.0-unstable-2025-04-26";

  src = fetchFromGitHub {
    owner = "cisco";
    repo = "mlspp";
    rev = "1cc50a124a3bc4e143a787ec934280dc70c1034d";
    hash = "sha256-IjS2yYnfScwJR3BqDJp37ANgNkCg9ECxON41tYEocvA=";
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
