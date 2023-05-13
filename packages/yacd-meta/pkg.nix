{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-13";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "e9999612a1f742d2aa98baddbfc5008761ac2555";
    fetchSubmodules = true;
    sha256 = "sha256-COa+cuILjTk6wTcbF9d8c6yrXvlBZ+xCoPHISMcO1Lo=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
