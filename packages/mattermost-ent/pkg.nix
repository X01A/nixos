{ stdenv, fetchurl, autoPatchelfHook, buildPhase ? "", ... }:

stdenv.mkDerivation rec {
  pname = "mattermost-ent";
  version = "7.10.4";
  src = fetchurl {
    url = "https://releases.mattermost.com/${version}/mattermost-${version}-linux-amd64.tar.gz";
    sha256 = "sha256-Ey2cH9CnQi8D5AvE8JWk6vTaRwIIr41R1ehTWB8hVMM=";
  };

  inherit buildPhase;

  nativeBuildInputs = [
    autoPatchelfHook
    stdenv.cc.cc.lib
  ];

  installPhase = ''
    cp -R . $out
  '';
}
