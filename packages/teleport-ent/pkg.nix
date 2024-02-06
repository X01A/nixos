{ fetchurl, stdenv, autoPatchelfHook, buildPhase ? "", ... }:

let
  version = "15.0.1";

  fetchSrc = {
    x86_64-linux = {
      url = "https://cdn.teleport.dev/teleport-ent-v${version}-linux-amd64-bin.tar.gz";
      sha256 = "sha256-iCxiM76RTcOGTqPpRyZeoCLqiJ5Rm0DQwjlf24wVFd0=";
    };
    aarch64-linux = {
      url = "https://cdn.teleport.dev/teleport-ent-v${version}-linux-arm64-bin.tar.gz";
      sha256 = "sha256-C4jfht74/GZVLgubDRtOcnawsJYywN2h7lJW6PGMPCY=";
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
