{
  stdenv,
  fetchurl,
  autoPatchelfHook,
  buildPhase ? "",
  ...
}:

stdenv.mkDerivation rec {
  pname = "mattermost-ent";
  version = "12.0.1";
  src = fetchurl {
    url = "https://releases.mattermost.com/${version}/mattermost-${version}-linux-amd64.tar.gz";
    sha256 = "sha256-90sm86JFsza13Hl4pxrHzRe6ImAd4saLIj3QEUyyZ2w=";
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
