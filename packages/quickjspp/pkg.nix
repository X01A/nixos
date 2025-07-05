{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "quickjspp";
  version = "20191027-unstable-2025-07-04";

  src = fetchFromGitHub ({
    owner = "ftk";
    repo = "quickjspp";
    rev = "01cdd3047ced48265b127790848a0ca88204f2c7";
    fetchSubmodules = true;
    sha256 = "sha256-mjnkbx/6DT0MXdeqA/2/CaMQy/iAUjIaGJT1Oi+JEqg=";
  });

  nativeBuildInputs = [ cmake ];
}
