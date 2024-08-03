{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "libcron";
  version = "1.3.1-unstable-2024-08-02";

  src = fetchFromGitHub ({
    owner = "PerMalmberg";
    repo = "libcron";
    rev = "aa3d4368d59abb9d51199755df7419194bc3e42e";
    fetchSubmodules = true;
    sha256 = "sha256-jPEhddfJ+qgIo6jq4BB24Z8KjyfrmiBfd6M/4oKCG/g=";
  });

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
  ];

  nativeBuildInputs = [ cmake ];
}
