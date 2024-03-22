{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "1.1.0-unstable-2024-03-08";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "5ec44fb9206695e5293f610b0a46d21851d0c966";
    fetchSubmodules = true;
    sha256 = "sha256-gjVLhgJtPho2lll6ukKYcRTfn3qDUBH35uH9CTF4NsM=";
  });

  nativeBuildInputs = [ cmake ];
}
