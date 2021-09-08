{ source, lib, stdenvNoCC, maven, zulu8, git, substituteAll, java-service-wrapper, unzip, makeWrapper }:

let
  mavenExec = maven.override {
    jdk = zulu8;
  };

  repo = stdenvNoCC.mkDerivation {
    name = "maven-repository-${source.pname}-${source.version}";
    inherit (source) src;
    buildInputs = [ mavenExec git ];

    buildPhase = ''
      mvn package -Dmaven.repo.local=$out
    '';

    # keep only *.{pom,jar,sha1,nbm} and delete all ephemeral files with lastModified timestamps inside
    installPhase = ''
      find $out -type f -regex '.+\(\.lastUpdated\|resolver-status\.properties\|_remote\.repositories\)' -delete
    '';

    dontFixup = true;
    outputHashAlgo = "sha256";
    outputHashMode = "recursive";

    outputHash = "J2Os6SkUMXnJ2ZA3XyoruVEPx/Ki6CGB2Egl6MjQcN0=";
  };
in
stdenvNoCC.mkDerivation rec {
  inherit (source) pname version src;

  buildInputs = [ mavenExec git unzip ];
  nativeBuildInputs = [ makeWrapper ];

  buildPhase = ''
    mvn -Dmaven.test.skip=true --offline -Dmaven.repo.local=${repo} package
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
