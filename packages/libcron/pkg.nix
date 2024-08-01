{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "libcron";
  version = "1.3.1-unstable-2024-07-31";

  src = fetchFromGitHub ({
    owner = "PerMalmberg";
    repo = "libcron";
    rev = "7c7d290792697eb7db27bae372961fecec86e39c";
    fetchSubmodules = true;
    sha256 = "sha256-D30JbyonMhW7w+u4ozzMY5Ys8l6Rkcqv2iRP8jf6FW4=";
  });

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
  ];

  nativeBuildInputs = [ cmake ];
}
