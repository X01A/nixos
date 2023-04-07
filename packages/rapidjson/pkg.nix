{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "unstable-2023-04-07";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "949c771b03de448bdedea80c44a4a5f65284bfeb";
    fetchSubmodules = true;
    sha256 = "sha256-CLdabmYSeiP433NoVP4T24BaLHyRSNZPnod+DTxhtoY=";
  });

  nativeBuildInputs = [ cmake ];
}
