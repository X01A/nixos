{ stdenv, fetchurl, autoPatchelfHook, buildPhase ? "", ... }:

stdenv.mkDerivation rec {
  pname = "mattermost-ent";
  version = "";
  src = fetchurl {
    url = "https://releases.mattermost.com/${version}/mattermost-${version}-linux-amd64.tar.gz";
    sha256 = "";
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
