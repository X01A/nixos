{ stdenvNoCC, nodejs_20, fetchzip, makeWrapper, buildNpmPackage, ... }:
let
  version = "10.4.0";
  src = fetchzip {
    url = "https://github.com/MCSManager/MCSManager/releases/download/v${version}/mcsmanager_linux_release.tar.gz";
    sha256 = "sha256-9V34DKf+CkbAAzYEVSbtmodcT1ON+lT6y1OWiMJSse0=";
  };

  pname = "mcsmanager";

  makeNodeModules = name: hash: buildNpmPackage {
    name = "mcsmanager-daemon-node-modules-${version}";
    inherit pname version;

    src = "${src}/${name}";

    npmDepsHash = hash;

    dontBuild = true;
    installPhase = ''
      cp -r node_modules $out/
    '';
  };

  daemonNodeModules = makeNodeModules "daemon" "sha256-v2r09BbkYqhlp7m4KAzQXYIayjl+yAmTsAjLl1cG8Fg=";
  webNodeModuels = makeNodeModules "web" "sha256-ePSup2SJlHvGXHYHMoGRDHJO5ZdnCaec0awRasj5rLo=";
in
stdenvNoCC.mkDerivation rec {
  inherit pname version src;

  dontConfigure = true;
  nativeBuildInputs = [ makeWrapper ];

  buildPhase = ''
    substituteInPlace daemon/app.js \
      --replace-fail 'process.cwd(), "lib"' "\"$out/mcsmanager/daemon\", \"lib\""

    substituteInPlace web/app.js \
      --replace-fail 'process.cwd(), "public"' "\"$out/mcsmanager/web\", \"public\""
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/mcsmanager

    cp -r ./* $out/mcsmanager
    cp -r ${daemonNodeModules} $out/mcsmanager/daemon/node_modules
    cp -r ${webNodeModuels} $out/mcsmanager/web/node_modules

    makeWrapper ${nodejs_20}/bin/node "$out/bin/mcsmanager-daemon" \
      --add-flags "$out/mcsmanager/daemon/app.js"


    makeWrapper ${nodejs_20}/bin/node "$out/bin/mcsmanager-web" \
      --add-flags "$out/mcsmanager/web/app.js"
    runHook postInstall
  '';
}
