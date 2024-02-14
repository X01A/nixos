{ stdenv, fetchurl, autoPatchelfHook, buildPhase ? "", ... }:

stdenv.mkDerivation rec {
  pname = "mattermost-ent";
  version = "9.4.3";
  src = fetchurl {
    url = "https://releases.mattermost.com/${version}/mattermost-${version}-linux-amd64.tar.gz";
    sha256 = "sha256-5qXJzJzmQy4fz1DyDkLu2dqBYYMa/mmbS4A1d/20hrU=";
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
