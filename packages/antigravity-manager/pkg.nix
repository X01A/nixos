{ lib
, stdenv
, fetchFromGitHub
, fetchurl
, buildNpmPackage
, rustPlatform
, pkg-config
, wrapGAppsHook3
, cmake
, perl
, gtk3
, webkitgtk_4_1
, libsoup_3
, librsvg
, libayatana-appindicator
, glib-networking
, openssl
, sqlite
, xdg-utils
,
}:

let
  pname = "antigravity-manager";
  version = "5.0.5-beta.1";

  src = fetchFromGitHub {
    owner = "lbjlaq";
    repo = "Antigravity-Manager";
    tag = "v${version}";
    hash = "sha256-1Li6e/rfjc4D/IILdD8z6Gb9z4Y8Px67mIn9P+iGuGA=";
  };

  # React/Vite frontend. The same asset tree is embedded into the Tauri binary
  # (custom-protocol feature) and installed to share/antigravity/dist so that
  # headless mode can serve the web UI from disk.
  frontend = buildNpmPackage {
    pname = "${pname}-frontend";
    inherit version src;

    npmDepsHash = "sha256-wOMAwB1DRAATsAU+FuknHfgGO+f/jPuheg438uCW5F0=";
    # upstream pins this in .npmrc as well
    npmFlags = [ "--legacy-peer-deps" ];

    installPhase = ''
      runHook preInstall
      mkdir -p $out
      cp -r dist $out/dist
      runHook postInstall
    '';
  };

  # rquest pulls in boring-sys2 with the `pq-experimental` feature, i.e. it
  # wants its patched BoringSSL snapshot. boring-sys2 normally patches and
  # builds that snapshot itself, but it shells out to `git apply` in the
  # (read-only) cargo vendor dir, and pointing it at an external tree via
  # BORING_BSSL_SOURCE_PATH trips its Bazel layout detection (BoringSSL's root
  # contains src/). So reproduce its build here: same snapshot, same patches,
  # shipped under <out>/build where boring-sys2 looks for a prebuilt one.
  boringSysVersion = "4.15.15";

  boringssl = stdenv.mkDerivation {
    pname = "boringssl-boring-sys2";
    version = boringSysVersion;

    src = fetchurl {
      url = "https://crates.io/api/v1/crates/boring-sys2/${boringSysVersion}/download";
      # the endpoint serves a plain tarball without a useful extension
      name = "boring-sys2-${boringSysVersion}.tar.gz";
      hash = "sha256-q2yHapWNFwV9nToxB1u5YJI3QTof5mVDJ4LDHvWW62s=";
    };

    nativeBuildInputs = [
      cmake
      perl
    ];

    # the two patches boring-sys2 applies before building
    postPatch = ''
      patch -d deps/boringssl -p1 < patches/boringssl-44b3df6f03d85c901767250329c571db405122d5.patch
      patch -d deps/boringssl -p1 < patches/boringssl-loongarch.patch
    '';

    dontUseCmakeConfigure = true;
    enableParallelBuilding = true;

    buildPhase = ''
      runHook preBuild
      cmake -S deps/boringssl -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON
      cmake --build build --target crypto ssl --parallel "$NIX_BUILD_CORES"
      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p $out/build $out/include
      cp build/libcrypto.a build/libssl.a $out/build/
      # this snapshot keeps the headers under src/include (no include/ at the root)
      cp -r deps/boringssl/src/include/. $out/include/
      runHook postInstall
    '';

    meta.description = "BoringSSL snapshot used by boring-sys2 ${boringSysVersion}";
  };
in
rustPlatform.buildRustPackage {
  inherit pname version src;

  # tauri-build refuses to compile when frontendDist (../dist) is missing.
  postPatch = ''
    ln -s ${frontend}/dist dist
  '';

  cargoRoot = "src-tauri";
  buildAndTestSubdir = "src-tauri";
  cargoLock.lockFile = "${src}/src-tauri/Cargo.lock";

  # Tests hit the network, the keyring and a shared ~/.antigravity_tools.
  doCheck = false;

  env = {
    BORING_BSSL_PATH = boringssl;
    BORING_BSSL_INCLUDE_PATH = "${boringssl}/include";
  };

  # note: no `ninja` here, its setup hook would take over buildPhase.
  nativeBuildInputs = [
    pkg-config
    wrapGAppsHook3
    rustPlatform.bindgenHook
  ];

  buildInputs = [
    gtk3
    webkitgtk_4_1
    libsoup_3
    librsvg
    libayatana-appindicator
    glib-networking
    openssl
    # nixpkgs' crate override links libsqlite3-sys against the system sqlite
    # (LIBSQLITE3_SYS_USE_PKG_CONFIG), so -lsqlite3 has to resolve here.
    sqlite
  ];

  gappsWrapperArgs = [
    "--prefix PATH : ${lib.makeBinPath [ xdg-utils ]}"
  ];

  postInstall = ''
    mkdir -p $out/share/antigravity
    cp -r ${frontend}/dist $out/share/antigravity/dist

    # desktop integration for the GUI binary
    install -Dm644 ${src}/src-tauri/icons/32x32.png $out/share/icons/hicolor/32x32/apps/antigravity-tools.png
    install -Dm644 ${src}/src-tauri/icons/128x128.png $out/share/icons/hicolor/128x128/apps/antigravity-tools.png
    install -Dm644 ${src}/src-tauri/icons/512x512.png $out/share/icons/hicolor/512x512/apps/antigravity-tools.png

    mkdir -p $out/share/applications
    printf '%s\n' \
      '[Desktop Entry]' \
      'Type=Application' \
      'Name=Antigravity Tools' \
      'Comment=Antigravity account manager and API proxy' \
      'Exec=antigravity-tools' \
      'Icon=antigravity-tools' \
      'Terminal=false' \
      'Categories=Utility;Development;' \
      'StartupWMClass=antigravity-tools' \
      > $out/share/applications/antigravity-tools.desktop
  '';

  meta = with lib; {
    description = "Antigravity account manager and API proxy (desktop app + headless server)";
    homepage = "https://github.com/lbjlaq/Antigravity-Manager";
    changelog = "https://github.com/lbjlaq/Antigravity-Manager/releases/tag/v${version}";
    # Upstream is CC-BY-NC-SA-4.0 (unfree in nixpkgs terms); deliberately left
    # out so the package set stays evaluable without allowUnfree, like
    # teleport-ent/rustdesk-server-pro here.
    mainProgram = "antigravity-tools";
    platforms = platforms.linux;
  };
}
