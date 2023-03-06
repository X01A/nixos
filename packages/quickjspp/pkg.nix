{ stdenv, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "quickjspp";
  version = "unstable-2022-07-22";

  src = fetchFromGitHub ({
    owner = "ftk";
    repo = "quickjspp";
    rev = "9cee4b4d27271d54b95f6f42bfdc534ebeaaeb72";
    fetchSubmodules = true;
    sha256 = "sha256-7iXL3cBoGbl+/vltjCboz2bWGTo/3hwxPO3IlDwLvJo=";
  });

  nativeBuildInputs = [ cmake ];
}
