{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "unstable-2023-05-17";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "973dc9c06dcd3d035ebd039cfb9ea457721ec213";
    fetchSubmodules = true;
    sha256 = "sha256-mL4C7Lmiz+EwAi2RHtIW38wlCaoJGlW+Fz9ioIR4sSc=";
  });

  nativeBuildInputs = [ cmake ];
}
