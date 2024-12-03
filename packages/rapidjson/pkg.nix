{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "1.1.0-unstable-2024-12-02";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "ebd87cb468fb4cb060b37e579718c4a4125416c1";
    fetchSubmodules = true;
    sha256 = "sha256-4EfTgkBtMc93/lUbKLL2pECmXOiE/ArN60pti5VNj6I=";
  });

  nativeBuildInputs = [ cmake ];
}
