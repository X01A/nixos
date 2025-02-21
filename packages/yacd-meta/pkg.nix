{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.7-unstable-2025-02-20";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "9746ca746061e803b89c8102c43e5d11ad001e69";
    fetchSubmodules = true;
    sha256 = "sha256-FDKvf8gzcpmxFXHWZfbf07dZqxOg/nY+yy2QhRvtYEY=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
