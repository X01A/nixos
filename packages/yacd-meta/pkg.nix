{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-02-16";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "bc89c7c0d2155a8355850e76125d4a62dab21afa";
    fetchSubmodules = true;
    sha256 = "sha256-okjcnyEYOIQzHY8u1HpHJcHgyiqbJCvrshmeLrUu164=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
