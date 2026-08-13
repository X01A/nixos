{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2026-08-12";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "ba5f198831a1ea984cf2f46c6c0d66325fde7022";
    fetchSubmodules = true;
    sha256 = "sha256-Q2LsMhcJ2OOoeUG0T3yqjorl7OAoNfmXjThvyVAi8YQ=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
