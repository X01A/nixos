{ fetchurl, stdenv, autoPatchelfHook, buildPhase ? "", ... }:

let
  info = import ./version.nix;
  inherit (info) version hash;

  fetchSrc = {
    x86_64-linux = {
      url = "https://cdn.teleport.dev/teleport-ent-v${version}-linux-amd64-bin.tar.gz";
      sha256 = hash.x86_64-linux;
    };
    aarch64-linux = {
      url = "https://cdn.teleport.dev/teleport-ent-v${version}-linux-arm64-bin.tar.gz";
      sha256 = hash.aarch64-linux;
    };
  }."${stdenv.system}" or (throw "Unsupported system");
in
stdenv.mkDerivation {
  pname = "teleport-ent";
  inherit version;

  src = fetchurl fetchSrc;

  inherit buildPhase;

  nativeBuildInputs = [
    autoPatchelfHook
    stdenv.cc.cc.lib
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp {tctl,teleport,tsh} $out/bin
  '';

  passthru.updateScript = ./update.sh;
  meta = {
    homepage = "https://github.com/gravitational/teleport";
    description = "Protect access to all of your infrastructure.";
    changelog = "https://github.com/gravitational/teleport/releases/tag/v${version}";
    mainProgram = "teleport";
    platforms = [ "x86_64-linux" "aarch64-linux" ];
  };
}
