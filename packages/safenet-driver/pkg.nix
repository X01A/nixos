{ fetchzip, stdenv, dpkg, pcsclite, autoPatchelfHook, glib, pango, gtk3 }:

stdenv.mkDerivation {
  pname = "safenet-driver";
  version = "10.8";

  src = fetchzip {
    url = "https://www.globalsign.com/en/safenet-drivers/USB/10.8/GlobalSign-SAC-Ubuntu-2004.zip";
    sha256 = "sha256-Z8vjrgtrg+yRHwuls4TUlmff9rjW96/QyQGtZN+hoVQ=";
  };

  buildInputs = [ dpkg pcsclite ];

  nativeBuildInputs = [
    autoPatchelfHook
    stdenv.cc.cc.lib
    glib
    pango
    gtk3
  ];

  buildPhase = ''
    dpkg -x safenetauthenticationclient_10.8.1050_amd64.deb .
  '';

  installPhase = ''
    mkdir -p $out
    cp -r usr/lib $out/lib
    cp -r usr/bin $out/bin
    cp -r usr/share $out/share
  '';
}
