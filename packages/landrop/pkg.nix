{
  stdenv,
  fetchFromGitHub,
  lib,
  libsForQt5,
  libsodium,
}:

let
  pname = "landrop";
  version = "0.4.0";
  landrop = fetchFromGitHub ({
    owner = "LANDrop";
    repo = "LANDrop";
    rev = "v${version}";
    fetchSubmodules = false;
    sha256 = "sha256-IwtphjMSa0e2mO5C4zHId48SUpT99sXziZzApnSmvrU=";
  });
in
stdenv.mkDerivation rec {
  inherit pname version;
  src = "${landrop}/LANDrop";

  buildInputs = with libsForQt5; [
    qtbase
    libsodium
  ];
  nativeBuildInputs = with libsForQt5; [
    wrapQtAppsHook
    qmake
  ];

  postPatch = ''
    substituteInPlace LANDrop.pro \
      --replace "PREFIX = /usr/local" "PREFIX = $out" \
      --replace "\$\$PWD/.." "${landrop}"
  '';
}
