{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "unstable-2023-05-10";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "2a1f586ba692ecbbf6d63c8ffbd4d837b1d4a9a4";
    fetchSubmodules = true;
    sha256 = "sha256-0/cnCGLLqi6eOa5/7541LFjV/PPM2B/2KD9xZBy2oJE=";
  });

  nativeBuildInputs = [ cmake ];
}
