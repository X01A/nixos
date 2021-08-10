{ source, stdenvNoCC, maven, jdk, git, substituteAll, java-service-wrapper, unzip, makeWrapper }:

stdenvNoCC.mkDerivation rec {
  inherit (source) pname version src;

  buildInputs = [ maven git unzip ];
  nativeBuildInputs = [ makeWrapper ];

  buildPhase = ''
    mkdir cache
    mvn -Dmaven.test.skip=true -Dmaven.repo.local=cache package
    unzip server-product/target/onedev-*.zip
  '';

  installPhase = ''
    mkdir -p $out
    mv onedev-*/* $out
    cp ${./wrapper.conf} $out/config.conf
    substituteInPlace $out/config.conf --replace "@out-dir@" $out
    substituteInPlace $out/config.conf --replace "@java-service-wrapper@" ${java-service-wrapper}
    substituteInPlace $out/config.conf --replace "@java-command@" ${jdk}/bin/java

    makeWrapper ${java-service-wrapper}/bin/wrapper "$out/bin/onedev" \
      --add-flags "-c $out/config.conf"
  '';
}
