{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "1.1.0-unstable-2024-08-16";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "7c73dd7de7c4f14379b781418c6e947ad464c818";
    fetchSubmodules = true;
    sha256 = "sha256-lRg5rPQAnpbGz9JM3PNGGUPVSupST3da87Cdi4tj55A=";
  });

  nativeBuildInputs = [ cmake ];
}
