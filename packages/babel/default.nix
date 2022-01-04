{ stdenv, fetchurl, lib, nodePackages, nodejs, makeWrapper, yarn2nix, ... }:

let
  version = "7.16.7";
in
stdenv.mkDerivation {
  name = "babel-cli";
  inherit version;

  src = yarn2nix.mkYarnPackage {
    name = "babel";
    src = ./.;
    packageJSON = ./package.json;
    yarnLock = ./yarn.lock;
  };

  nativeBuildInputs = [ makeWrapper ];
  buildInputs = [
    nodePackages.npm nodejs
  ];

  buildPhase = ''
    ls -lah
    exit 1
  '';

  installPhase = ''
    rm -f $out/bin/babel
    makeWrapper ${nodejs}/bin/node "$out/bin/babel" \
      --add-flags "$out/lib/node_modules/@babel/cli/bin/babel.js"
    rm -f $out/lib/node_modules/@babel/cli
    cp -r . $out/lib/node_modules/@babel/cli
  '';
}
