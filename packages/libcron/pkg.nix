{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "libcron";
  version = "1.3.1-unstable-2025-06-01";

  src = fetchFromGitHub ({
    owner = "PerMalmberg";
    repo = "libcron";
    rev = "de143e8b8eea0615e8c660c7408a3fd075b5b45c";
    fetchSubmodules = true;
    sha256 = "sha256-X59U+VrqFU1r45R+FzV/AkywOyxLX2oXzoIuS8EsuVc=";
  });

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
  ];

  nativeBuildInputs = [ cmake ];
}
