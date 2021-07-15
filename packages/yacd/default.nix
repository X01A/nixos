{ stdenv, source, yarn, mkYarnModules, nodejs-12_x }:

stdenv.mkDerivation rec {
  inherit (source) pname version src;

  nodeModules = mkYarnModules {
    name = "${pname}-node-modules-${version}";
    inherit pname version;
    # it is vitally important the the package.json has name and version fields
    packageJSON = ./package.json;
    yarnLock = ./yarn.lock;
  };

  buildPhase = ''
    ln -s ${nodeModules}/node_modules .
    yarn run --offline build
  '';

  installPhase = ''
    cp -r build $out
  '';
}
