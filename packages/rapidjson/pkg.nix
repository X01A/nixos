{
  stdenv,
  fetchFromGitHub,
  cmake,
}:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "1.1.0-unstable-2025-02-05";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "24b5e7a8b27f42fa16b96fc70aade9106cf7102f";
    fetchSubmodules = true;
    sha256 = "sha256-fCiPqNrC1dB7f3InIMHMbHhapB9cSyMCaH9qoO3FPAk=";
  });

  nativeBuildInputs = [ cmake ];
}
