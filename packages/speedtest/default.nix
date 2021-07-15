{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  pname = "speedtest-cli";
  version = "1.0.0";

  src = fetchurl {
    url = "https://install.speedtest.net/app/cli/ookla-speedtest-${version}-x86_64-linux.tgz";
    sha256 = "0s1icdqdkr1g4dsnsqvh1a4vp4b61vvrr7qx4gsf89s41n7h5qjz";
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
