{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "rapidjson";
  version = "unstable-2023-08-14";

  src = fetchFromGitHub ({
    owner = "tencent";
    repo = "rapidjson";
    rev = "30f54566adfc33d303d56e19cedf01f77602e7da";
    fetchSubmodules = true;
    sha256 = "sha256-m52N3ijzdh+RxPbSB5C8zPfFI9rKLaEB8Fnsyy0ynek=";
  });

  nativeBuildInputs = [ cmake ];
}
