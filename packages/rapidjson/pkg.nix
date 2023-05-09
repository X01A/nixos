{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "unstable-2023-05-09";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "0e88d5e40448616ede258be29e6e337eb99aa104";
    fetchSubmodules = true;
    sha256 = "sha256-R7F113QhnM9FlV3ErCYCrJwoaQiwqs1IHvIBDTN7pgw=";
  });

  nativeBuildInputs = [ cmake ];
}
