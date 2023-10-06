{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "unstable-2023-09-28";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "f9d53419e912910fd8fa57d5705fa41425428c35";
    fetchSubmodules = true;
    sha256 = "sha256-YAhuoA6RVFMWSETotJ+cGgs43Q8XIlRKPlpC7nuMZQg=";
  });

  nativeBuildInputs = [ cmake ];
}
