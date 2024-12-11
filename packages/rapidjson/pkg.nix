{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "1.1.0-unstable-2024-12-10";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "58c6938b73c8685d82905ed55ec5b59e8f163687";
    fetchSubmodules = true;
    sha256 = "sha256-QQ9MumkDXHg8CKMw0gZ6ZhsXLQ/ul4YV3SJ4lepfAYM=";
  });

  nativeBuildInputs = [ cmake ];
}
