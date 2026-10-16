{
  stdenv,
  fetchurl,
  autoPatchelfHook,
  buildPhase ? "",
  ...
}:

stdenv.mkDerivation rec {
  pname = "mattermost-ent";
  version = "12.0.0";
  src = fetchurl {
    url = "https://releases.mattermost.com/${version}/mattermost-${version}-linux-amd64.tar.gz";
    sha256 = "sha256-C7HAnXmqYIpF2//l0VN7umCDX6M8H2H46+7mHcU+RME=";
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
