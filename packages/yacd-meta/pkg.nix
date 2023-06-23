{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-06-23";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "6208ae67f7ca31ee92d10efb4a823f5e81854e72";
    fetchSubmodules = true;
    sha256 = "sha256-6D0l5mNPfVh1/Ocm12U1AihJ+i6wVb7IME+oWCdkrR8=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
