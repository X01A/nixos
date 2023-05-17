{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-17";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "99d7027574c3f7589ad7abe504e17d1c669a8739";
    fetchSubmodules = true;
    sha256 = "sha256-6TTf0hMTWoO/CgeYG5Z2Fns/BJ5SsM8Qta/nvJd4K+M=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
