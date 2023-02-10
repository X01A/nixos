{ stdenv, fetchurl }:

let
  version = "1.1.1";

  fetchSrc = {
    x86_64-linux = {
      url = "https://install.speedtest.net/app/cli/ookla-speedtest-${version}-linux-x86_64.tgz";
      sha256 = "0304lfqpxq2xzf7vhgri0jzcflcvixjaz3q8bzkl3mz4zvypf14p";
    };
    aarch64-linux = {
      url = "https://install.speedtest.net/app/cli/ookla-speedtest-${version}-linux-aarch64.tgz";
      sha256 = "1n8z8f6kml0k383vcvgwiwsyv4mackyc500ml8jcmhz17y3l0si7";
    };
  }."${stdenv.system}" or (throw "Unsupported system");
in
stdenv.mkDerivation rec {
  pname = "speedtest-cli";
  inherit version;

  src = fetchurl {
    inherit (fetchSrc) url sha256;
    name = "${pname}-${version}.tar.gz";
  };

  setSourceRoot = "sourceRoot=`pwd`";

  meta.description = "CLI for SpeedTest";

  buildPhase = ''
    tar zxvf $src
  '';

  installPhase = ''
    mkdir -p "$out"/bin/
    install -m 755 speedtest -t "$out"/bin/
  '';
}
