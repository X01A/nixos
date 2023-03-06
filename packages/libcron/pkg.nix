{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "libcron";
  version = "unstable-2022-08-27";

  src = fetchFromGitHub ({
    owner = "PerMalmberg";
    repo = "libcron";
    rev = "0dd9df49d7833a2d2119e4a6ff8282df58b12d5d";
    fetchSubmodules = true;
    sha256 = "sha256-/n90h53uKvFhLJeQqbwwvPo3yfE4A0MS7kLjWYX7LI4=";
  });

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
  ];

  nativeBuildInputs = [ cmake ];
}
