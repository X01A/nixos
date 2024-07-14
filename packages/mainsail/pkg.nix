{ lib
, stdenvNoCC
, fetchzip
}:

stdenvNoCC.mkDerivation rec {
  pname = "mainsail";
  version = "2.12.0";

  src = fetchzip {
    url = "https://github.com/mainsail-crew/mainsail/releases/download/v${version}/mainsail.zip";
    sha256 = "sha256-scdh89mDJjuu1tDXTLSjSCL/lUf/Fq9+cCU59gg6d+8=";
    stripRoot = false;
  };

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/mainsail
    cp -r ./* $out/share/mainsail
    runHook postInstall
  '';

  meta = with lib; {
    description = "Web interface for managing and controlling 3D printers with Klipper";
    homepage = "https://docs.mainsail.xyz";
    changelog = "https://github.com/mainsail-crew/mainsail/releases/tag/v${version}";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
