{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "unstable-2023-03-06";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "083f359f5c36198accc2b9360ce1e32a333231d9";
    fetchSubmodules = true;
    sha256 = "sha256-vshPga8POmzXkgkiLn/UJSpqXIJoLuujdLHkKTX2IKs=";
  });

  nativeBuildInputs = [ cmake ];
}
