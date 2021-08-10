{ source, stdenvNoCC, maven, zulu8, git, substituteAll, java-service-wrapper, unzip, makeWrapper }:

let
  maven-jdk8 = maven.override {
    jdk = zulu8;
  };
in
stdenvNoCC.mkDerivation rec {
  inherit (source) pname version src;

  buildInputs = [ maven-jdk8 git unzip ];
  nativeBuildInputs = [ makeWrapper ];

  buildPhase = ''
    mkdir maven
    mvn -Dmaven.test.skip=true -Dmaven.repo.local=maven package
    unzip server-product/target/onedev-*.zip
  '';

  installPhase = ''
    mkdir -p $out
    mv onedev-*/* $out
    cp ${./wrapper.conf} $out/config.conf
    substituteInPlace $out/config.conf --replace "@out-dir@" $out
    substituteInPlace $out/config.conf --replace "@java-service-wrapper@" ${java-service-wrapper}
    substituteInPlace $out/config.conf --replace "@java-command@" ${zulu8}/bin/java

    makeWrapper ${java-service-wrapper}/bin/wrapper "$out/bin/onedev" \
      --add-flags "-c $out/config.conf"
  '';
}
