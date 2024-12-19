{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "1.1.0-unstable-2024-12-18";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "d621dc9e9c77f81e5c8a35b8dcc16dcd63351321";
    fetchSubmodules = true;
    sha256 = "sha256-ZU/d1ZZ4WDS8iDpg57IspF45mpFQeiAVaMs0ANxX+Ls=";
  });

  nativeBuildInputs = [ cmake ];
}
