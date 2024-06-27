{ stdenv, glibc, fetchurl }:


let
  info = import ./version.nix;
  inherit (info) version hash;

  fetchSrc = {
    x86_64-linux = {
      url = "https://github.com/alist-org/alist/releases/download/v${version}/alist-linux-musl-amd64.tar.gz";
      sha256 = hash.x86_64-linux;
    };
    aarch64-linux = {
      url = "https://github.com/alist-org/alist/releases/download/v${version}/alist-linux-musl-arm64.tar.gz";
      sha256 = hash.aarch64-linux;
    };
  }."${stdenv.system}" or (throw "Unsupported system");
in
stdenv.mkDerivation rec {
  pname = "alist";
  inherit version;

  src = fetchurl {
    inherit (fetchSrc) url sha256;
    name = "${pname}-${version}.tgz";
  };

  phases = "installPhase";

  installPhase = ''
    tar zxvf $src
    mkdir -p "$out"/bin/
    install -m 755 alist -t "$out"/bin/
  '';

  passthru.updateScript = ./update.sh;
  meta = {
    mainProgram = "alist";
  };
}
