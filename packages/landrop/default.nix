{ stdenv, fetchgit, lib, libsForQt5, libsodium, source, ... }:

let
  landrop = source.src;
in
stdenv.mkDerivation rec {
  inherit (source) pname version;
  src = "${landrop}/LANDrop";

  buildInputs = with libsForQt5; [ qtbase libsodium ];
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
