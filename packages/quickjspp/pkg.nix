{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "quickjspp";
  version = "unstable-2023-12-21";

  src = fetchFromGitHub ({
    owner = "ftk";
    repo = "quickjspp";
    rev = "0c00c48895919fc02da3f191a2da06addeb07f09";
    fetchSubmodules = true;
    sha256 = "sha256-YdDSs5KkjnX2tjI4wDsEqDSPYahKSocnxtnBgiv6xcA=";
  });

  nativeBuildInputs = [ cmake ];
}
