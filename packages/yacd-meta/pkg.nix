{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.7-unstable-2025-10-30";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "99ce7a10abb8214de09ca0b04ef8fd307890a4fe";
    fetchSubmodules = true;
    sha256 = "sha256-QRQJ88JhqBIqf3pCkDM5nMWxNuibcWGP0dKn3f9PSjk=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
