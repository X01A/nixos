{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "unstable-2023-08-15";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "956063dbc185df9289345880149ba48d11745ac4";
    fetchSubmodules = true;
    sha256 = "sha256-HxpqgzgkriML6fwJjXh12fc85q143kVPcq836pHzQiU=";
  });

  nativeBuildInputs = [ cmake ];
}
