{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "libcron";
  version = "unstable-2023-11-14";

  src = fetchFromGitHub ({
    owner = "PerMalmberg";
    repo = "libcron";
    rev = "41f238ceb09d4179e7346d78584a0c978e5d0059";
    fetchSubmodules = true;
    sha256 = "sha256-y26mV+JtZkrDWtDLURV87mDNNYMqL9hJ3CuwIXoJw4I=";
  });

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
  ];

  nativeBuildInputs = [ cmake ];
}
