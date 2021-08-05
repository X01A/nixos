{ electron, makeWrapper, appimageTools, stdenv, lib }:

{ icon
, source
, desktopIcon
, postInstall ? null
}:
let
  appImage = appimageTools.extractType2 {
    inherit (source) src;
    name = "${source.pname}-${source.version}";
  };
in
stdenv.mkDerivation rec {
  inherit (source) pname version;

  src = appImage;
  nativeBuildInputs = [ makeWrapper ];


  installPhase = ''
    # Asar
    mkdir -p "$out/share/${source.pname}"
    cp -r resources/app.asar $out/share/${source.pname}

    # Icon
    mkdir -p $out/share/icons/hicolor/128x128/apps/
    cp ${icon} $out/share/icons/hicolor/128x128/apps/
    install -Dm644 "${desktopIcon}/share/applications/"* \
      -t $out/share/applications/

    ${lib.optionalString (postInstall != null) postInstall}
  '';

  postFixup = ''
    makeWrapper ${electron}/bin/electron "$out/bin/${source.pname}" \
      --add-flags "$out/share/${source.pname}/app.asar" \
      --set ELECTRON_IS_DEV 0 \
      --set NODE_ENV production
  '';

  distPhase = ":";
}
