{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-06-21";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "6777efc201af5dbc899a27ebc32d0b34ad09a1e3";
    fetchSubmodules = true;
    sha256 = "sha256-kqBC0tDFW9ElNU/DEBqfkavteakHaFxQRPDR451D4B8=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
