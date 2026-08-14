{
  stdenv,
  fetchurl,
  autoPatchelfHook,
  buildPhase ? "",
  ...
}:

stdenv.mkDerivation rec {
  pname = "mattermost-ent";
  version = "11.10.0";
  src = fetchurl {
    url = "https://releases.mattermost.com/${version}/mattermost-${version}-linux-amd64.tar.gz";
    sha256 = "sha256-iuQE7QwPurKwHADAMbnQ8+F8UQB+O7NAG+uvPmDaDD4=";
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
