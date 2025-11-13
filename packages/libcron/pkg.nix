{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "libcron";
  version = "1.3.3-unstable-2025-10-14";

  src = fetchFromGitHub ({
    owner = "PerMalmberg";
    repo = "libcron";
    rev = "ee34810b11bd23c8be637345532f91059b68b2d7";
    fetchSubmodules = true;
    sha256 = "sha256-j3wHdOx25RgAarXe598rJhg7aHSrk71F8u6hYazXHYo=";
  });

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
  ];

  nativeBuildInputs = [ cmake ];
}
