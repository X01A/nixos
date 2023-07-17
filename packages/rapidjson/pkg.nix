{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "unstable-2023-07-17";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "a95e013b97ca6523f32da23f5095fcc9dd6067e5";
    fetchSubmodules = true;
    sha256 = "sha256-gjrLDYahM+8hRaK66CPydP9A04G2WYQVvZmpJj4doDg=";
  });

  nativeBuildInputs = [ cmake ];
}
