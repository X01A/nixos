{ stdenv, fetchurl, autoPatchelfHook, buildPhase ? "", ... }:

stdenv.mkDerivation rec {
  pname = "mattermost-ent";
  version = "9.8.1";
  src = fetchurl {
    url = "https://releases.mattermost.com/${version}/mattermost-${version}-linux-amd64.tar.gz";
    sha256 = "sha256-uLCWc6cx62zaUmiDg+ClxRSEU6eXKnUyLbUi89ruUkg=";
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
