{ lib, stdenvNoCC, fetchFromGitHub, buildGo117Module, source, npmlock2nix, jq }:

let
  webSrc = stdenvNoCC.mkDerivation {
    pname = "${source.pname}-web-src";
    inherit (source) version src;

    phases = [ "buildPhase" ];
    # set missing version
    buildPhase = ''
      cp --no-preserve=mode,ownership -r $src/client $out
      ${jq}/bin/jq ".version = \"${source.version}\"" $out/package-lock.json > test.json
      rm -f $out/package-lock.json
      mv test.json $out/package-lock.json
    '';
  };

  web = npmlock2nix.buildNpmPackage {
    # pname = "${source.pname}-web";
    # inherit (source) version;
    # nodejs = nodejs-14_x;

    src = webSrc;

    npmBuild = "npm run build";
    installPhase = "cp -r dist $out";

  };
in
buildGo117Module rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-Q8H4Wbese+1TG6DkLHZJySY76xWpMD/dCFQCB6Zm0Vw=";

  # modSha256 = lib.fakeSha256;
  subPackages = [ "cmd" ];

  fixupPhase = ''
    mkdir -p $out/assets
    cp -r ${web} $out/assets/www
    cp -r $src/assets/email $out/assets
    cd $out/bin
    mv cmd pufferpanel
  '';

  doCheck = false;
}
