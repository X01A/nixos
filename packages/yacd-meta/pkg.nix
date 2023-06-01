{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-06-01";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "4368d165d949c0591e0077c74e237704e7060d10";
    fetchSubmodules = true;
    sha256 = "sha256-bNqYadxHg5iS8UT7m6eHz2gW5aY5ml9jn7yL/V4jK/8=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
