{ stdenv, source, yarn, mkYarnModules, nodejs-12_x, esbuild }:

stdenv.mkDerivation rec {
  inherit (source) pname version src;

  nodeModules = mkYarnModules {
    name = "${pname}-node-modules-${version}";
    inherit pname version;
    # it is vitally important the the package.json has name and version fields
    packageJSON = "${src}/package.json";
    yarnLock = "${src}/yarn.lock";
  };

  buildInputs = [ nodejs-12_x yarn ];

  # Fix esbuild
  # https://discourse.nixos.org/t/building-a-sveltekit-app-with-nix/13002
  configurePhase = ''
    cp -r  ${nodeModules}/node_modules .
    chmod -R +w node_modules
    ln -sf ${esbuild}/bin/esbuild node_modules/esbuild/bin/esbuild
  '';

  buildPhase = ''
    yarn run --offline build
  '';

  installPhase = ''
    cp -r public $out
  '';
}
