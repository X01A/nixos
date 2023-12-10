{ lib, stdenvNoCC, fetchFromGitHub, buildGoModule, npmlock2nix, jq }:

let
  pname = "pufferpanel";
  version = "v2.6.2";
  src = fetchFromGitHub ({
    owner = "PufferPanel";
    repo = "PufferPanel";
    rev = "v2.6.2";
    fetchSubmodules = true;
    sha256 = "sha256-Mwg4wKhbF1ohXGk2VwZrG5Xc5kdhrg5+Wnf0phv53qU=";
  });

  webSrc = stdenvNoCC.mkDerivation {
    name = "${pname}-web-src";

    inherit version src;
    phases = [ "buildPhase" ];
    # set missing version
    buildPhase = ''
      cp --no-preserve=mode,ownership -r $src/client $out
      ${jq}/bin/jq ".version = \"${version}\"" $out/package-lock.json > test.json
      rm -f $out/package-lock.json
      mv test.json $out/package-lock.json
    '';
  };

  web = npmlock2nix.buildNpmPackage {
    src = webSrc;

    npmBuild = "npm run build";
    installPhase = "cp -r dist $out";

  };
in
buildGoModule {
  inherit pname version src;
  vendorHash = "sha256-w3PExVOUQQLyjBvRUVqFfNc131ys4UpH6q/eFVCVye8=";

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
