{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "unstable-2023-12-06";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "6089180ecb704cb2b136777798fa1be303618975";
    fetchSubmodules = true;
    sha256 = "sha256-fYTy5yOjPPLAMHnN0RtUDrGIZyb8C7n3RWlrLbdBvfs=";
  });

  nativeBuildInputs = [ cmake ];
}
