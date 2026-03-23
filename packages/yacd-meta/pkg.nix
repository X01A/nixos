{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2026-03-22";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "8316677ff80fdfcb3ceedb133f6bdc6a5cc3ee0c";
    fetchSubmodules = true;
    sha256 = "sha256-XoKBw5GdrgvEJl5aRt7f5vDNbpvPLdsQMaoWCgG3SBg=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
