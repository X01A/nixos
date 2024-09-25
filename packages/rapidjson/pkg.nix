{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "1.1.0-unstable-2024-09-24";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "815e6e7e7e14be44a6c15d9aefed232ff064cad0";
    fetchSubmodules = true;
    sha256 = "sha256-CEEClqcbW9NLjVwMZiJCv5J6OxCzOsj1zviUNOGK+Io=";
  });

  nativeBuildInputs = [ cmake ];
}
