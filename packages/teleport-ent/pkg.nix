{ fetchurl, stdenv, autoPatchelfHook, buildPhase ? "", ... }:

let
  version = "15.1.4";

  fetchSrc = {
    x86_64-linux = {
      url = "https://cdn.teleport.dev/teleport-ent-v${version}-linux-amd64-bin.tar.gz";
      sha256 = "sha256-wv5hifFqS8Wqc50TNizVgQw5J5DRLBY+uubvhOGvwuA=";
    };
    aarch64-linux = {
      url = "https://cdn.teleport.dev/teleport-ent-v${version}-linux-arm64-bin.tar.gz";
      sha256 = "sha256-XGT7OlvSxcIaqeO84g4L+QFEzuZdF7nGS+UVqjz3vww=";
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

  meta = {
    homepage = "https://github.com/gravitational/teleport";
    description = "Protect access to all of your infrastructure.";
    changelog = "https://github.com/gravitational/teleport/releases/tag/v${version}";
    mainProgram = "teleport";
    platforms = [ "x86_64-linux" "aarch64-linux" ];
  };
}
