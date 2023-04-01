{ fetchFromGitHub, buildGoModule, stdenvNoCC, yarn2nix-moretea, jq, nodejs, nodePackages }:

let
  version = "0.11.2";
  src = fetchFromGitHub ({
    owner = "usememos";
    repo = "memos";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-VCt1dHxADj+vQRh6NQZEFM8SheQr7zLl42pVuYRj4aU=";
  });

  # patch package.json add version field
  # otherwish mkYarnModules not working
  srcPatched = stdenvNoCC.mkDerivation {
    name = "memos-src";
    inherit version;
    src = "${src}/web";

    buildPhase = ''
      ${jq}/bin/jq --arg a "${version}" '.version = $a' package.json > .tmp.json
      rm -f package.json
      mv .tmp.json package.json
    '';

    installPhase = ''
      cp -r . $out
    '';
  };

  yarnModule = yarn2nix-moretea.mkYarnModules {
    inherit version;
    pname = "memos-web-yarn";
    packageJSON = "${srcPatched}/package.json";
    yarnLock = "${srcPatched}/yarn.lock";
  };

  frontent = stdenvNoCC.mkDerivation {
    name = "memos-web";
    inherit version;

    src = srcPatched;

    buildInputs = with nodePackages; [ nodejs yarn ];

    buildPhase = ''
      ln -s ${yarnModule}/node_modules node_modules
      export HOME=$(mktemp -d)
      yarn --offline build
    '';

    installPhase = ''
      cp -r dist $out
    '';
  };
in
buildGoModule rec {
  pname = "memos";
  inherit version src;

  # check will unable to access network in sandbox
  doCheck = false;
  vendorSha256 = "sha256-qVaaIFuyT2AQJMF7TcooiiUIu6wi1TKMS2UYtazOzNI=";
  postPatch = ''
    rm -rf server/dist
    cp -r ${frontent} server/dist
  '';
}
