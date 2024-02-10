{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "unstable-2024-02-09";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "3f73edae00aba5b0112a80b4d41e6f1ff7d92a3d";
    fetchSubmodules = true;
    sha256 = "sha256-TCfV+nC033wqtFqTrFXvfzWq//PWhoDQfMPzdWSnpK0=";
  });

  nativeBuildInputs = [ cmake ];
}
