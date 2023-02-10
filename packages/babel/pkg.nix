{ stdenv, fetchurl, lib, nodePackages, nodejs, makeWrapper, mkYarnPackage, ... }:

let
  version = "7.16.7";
in
stdenv.mkDerivation {
  name = "babel-cli";
  inherit version;

  src = mkYarnPackage {
    name = "babel";
    src = ./.;
    packageJSON = ./package.json;
    yarnLock = ./yarn.lock;
  };

  nativeBuildInputs = [ makeWrapper ];
  buildInputs = [
    nodePackages.npm
    nodejs
  ];

  buildPhase = ''
    mkdir -p $out/lib/node_modules
    cp -r libexec/babel/node_modules $out/lib/
  '';

  installPhase = ''
    mkdir -p $out/bin
    makeWrapper ${nodejs}/bin/node "$out/bin/babel" \
      --add-flags "$out/lib/node_modules/@babel/cli/bin/babel.js"
  '';
}
