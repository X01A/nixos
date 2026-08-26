{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2026-08-25";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "690220068988c603f4b8f325e4193fdf8023f784";
    fetchSubmodules = true;
    sha256 = "sha256-l15oIz14+XKFmtuS46Ao/kqlX8ckv6i73A2zl9xb4Ps=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
