{ source, stdenv, fetchurl, appimageTools, unzip, runCommand, autoPatchelfHook, webkitgtk, gst_all_1, makeWrapper, ... }:

stdenv.mkDerivation rec {
  inherit (source) version pname;

  src = appimageTools.extractType2 {
    name = "${pname}-${version}-src";
    src = runCommand "${pname}-${version}-unzip" {} ''
      ${unzip}/bin/unzip ${source.src}
      mv OrcaSlicer_ubu64.AppImage $out
    '';
  };

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [ webkitgtk ];
  # ++ (with gst_all_1; [
  #   gstreamer
  #   gst-plugins-base
  #   gst-plugins-good
  #   gst-plugins-ugly
  #   gst-plugins-bad
  #   gst-libav
  # ]);

  distPhase = ":";
  unpackPhase = ":";

  installPhase = ''
    cp --no-preserve=mode,ownership -r $src $out

    mv $out/bin/orca-slicer $out/bin/.orca-slicer
    chmod +x $out/bin/.orca-slicer

    cd $out
    mv usr/share .
    rmdir usr
    mkdir share/applications
    sed -i 's#AppRun %F#orca-slicer#g' OrcaSlicer.desktop
    mv OrcaSlicer.desktop share/applications

    makeWrapper $out/bin/.orca-slicer "$out/bin/orca-slicer" \
      --set GST_PLUGIN_PATH "${gst_all_1.gst-plugins-base}/lib/gstreamer-1.0/:${gst_all_1.gst-plugins-good}/lib/gstreamer-1.0/:${gst_all_1.gst-plugins-bad}/lib/gstreamer-1.0/:${gst_all_1.gst-libav}/lib/gstreamer-1.0/" \
      --prefix PATH : ${gst_all_1.gstreamer.dev}/bin
  '';
}
