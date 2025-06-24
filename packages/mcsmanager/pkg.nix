{ lib, stdenvNoCC, nodejs_20, fetchzip, makeWrapper, buildNpmPackage, ... }:
let
  version = "10.6.1";
  src = fetchzip {
    url = "https://github.com/MCSManager/MCSManager/releases/download/v${version}/mcsmanager_linux_release.tar.gz";
    sha256 = "sha256-qc3U/AdUjtrDmOJnSIy65EW8jRW3fWUGn/eclTk6ZXI=";
  };

  pname = "mcsmanager";

  makeNodeModules = name: hash: buildNpmPackage {
    name = "mcsmanager-${name}-node-modules-${version}";
    inherit pname version;

    src = "${src}/${name}";

    npmDepsHash = hash;

    dontBuild = true;
    installPhase = ''
      cp -r node_modules $out/
    '';
  };

  daemonNodeModules = makeNodeModules "daemon" "sha256-61JgXNgkNOa+tmYh0wfnVTDNy9HMcZ5e7D+9Wo13AIo=";
  webNodeModuels = makeNodeModules "web" "sha256-6sjibB3P1d5KMb6pEQ+h622sUEMqynisYnXn05+E2lM=";
in
stdenvNoCC.mkDerivation rec {
  inherit pname version src;

  dontConfigure = true;
  nativeBuildInputs = [ makeWrapper ];

  buildPhase = ''
    substituteInPlace daemon/app.js \
      --replace-fail 'process.cwd(), "lib"' "\"$out/mcsmanager/daemon\", \"lib\""

    substituteInPlace daemon/app.js \
      --replace-fail 'const PACKAGE_JSON = "package.json";' "const PACKAGE_JSON = \"$out/mcsmanager/daemon/package.json\";"

    substituteInPlace web/app.js \
      --replace-fail 'process.cwd(), "public"' "\"$out/mcsmanager/web\", \"public\""

    substituteInPlace web/app.js \
      --replace-fail 'const PACKAGE_JSON = "package.json";' "const PACKAGE_JSON = \"$out/mcsmanager/web/package.json\";"

    substituteInPlace daemon/app.js \
      --replace-fail 'fs_extra_1.default.chmodSync(const_2.' "// fs_extra_1.default.chmodSync(const_2."

    chmod -R 755 daemon/lib/
  '';
  dontCheckForBrokenSymlinks = true;
  installPhase = ''
    runHook preInstall
    mkdir -p $out/mcsmanager

    rm -rf daemon/node_modules
    rm -rf web/node_modules
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
