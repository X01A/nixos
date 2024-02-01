{ fetchurl, stdenv, autoPatchelfHook, buildPhase ? "", ... }:

let
  version = "15.0.0";

  fetchSrc = {
    x86_64-linux = {
      url = "https://cdn.teleport.dev/teleport-ent-v${version}-linux-amd64-bin.tar.gz";
      sha256 = "sha256-syHiNMd/TdvQhMGn3N9U5DMUKn+jbXsKn4MUlS7oFHQ=";
    };
    aarch64-linux = {
      url = "https://cdn.teleport.dev/teleport-ent-v${version}-linux-arm64-bin.tar.gz";
      sha256 = "sha256-LlI6ooWAVr3kedHAvh7o4RjG3n6Xa70+uYW6JCR5RBw=";
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
