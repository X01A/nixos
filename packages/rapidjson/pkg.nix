{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "1.1.0-unstable-2024-04-09";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "ab1842a2dae061284c0a62dca1cc6d5e7e37e346";
    fetchSubmodules = true;
    sha256 = "sha256-D0vNscn965k3u3fLm4SN7W1ThLvxa1z1TmrLtpHj8oA=";
  });

  nativeBuildInputs = [ cmake ];
}
