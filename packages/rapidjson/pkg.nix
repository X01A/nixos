{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "1.1.0-unstable-2024-10-07";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "858451e5b7d1c56cf8f6d58f88cf958351837e53";
    fetchSubmodules = true;
    sha256 = "sha256-k/1rzUQE6AeKs38SHMMO5jH8xDAvc4B2Y6Ygm6kIWgQ=";
  });

  nativeBuildInputs = [ cmake ];
}
