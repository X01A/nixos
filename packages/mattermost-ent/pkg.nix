{
  stdenv,
  fetchurl,
  autoPatchelfHook,
  buildPhase ? "",
  ...
}:

stdenv.mkDerivation rec {
  pname = "mattermost-ent";
  version = "11.11.1";
  src = fetchurl {
    url = "https://releases.mattermost.com/${version}/mattermost-${version}-linux-amd64.tar.gz";
    sha256 = "sha256-8eqqpISNv5b6g5z43YD7voJeJBdEpNyDkxeJVRG8hK4=";
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
