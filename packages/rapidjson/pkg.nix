{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "unstable-2023-08-21";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "476ffa2fd272243275a74c36952f210267dc3088";
    fetchSubmodules = true;
    sha256 = "sha256-UlKmJ4eagV80t3dLfxIn28ydH4NXzslZJeDwrn1E+Us=";
  });

  nativeBuildInputs = [ cmake ];
}
