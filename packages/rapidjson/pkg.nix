{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "unstable-2023-08-17";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "5e17dbed34eef33af8f3e734820b5dc547a2a3aa";
    fetchSubmodules = true;
    sha256 = "sha256-zX/GM5dvQNx9phON3X9atBUcEhM315j2r+9TggiCYjo=";
  });

  nativeBuildInputs = [ cmake ];
}
