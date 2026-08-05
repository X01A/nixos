{
  stdenv,
  fetchurl,
  autoPatchelfHook,
  buildPhase ? "",
  ...
}:

stdenv.mkDerivation rec {
  pname = "mattermost-ent";
  version = "11.9.0";
  src = fetchurl {
    url = "https://releases.mattermost.com/${version}/mattermost-${version}-linux-amd64.tar.gz";
    sha256 = "sha256-izNSE96/qBcISHDwnijD7Ku4mcv785oWfYHe5o2W1uM=";
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
