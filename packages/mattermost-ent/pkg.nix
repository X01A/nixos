{ stdenv, fetchurl, autoPatchelfHook, buildPhase ? "", ... }:

stdenv.mkDerivation rec {
  pname = "mattermost-ent";
  version = "7.7.1";
  src = fetchurl {
    url = "https://releases.mattermost.com/7.7.1/mattermost-7.7.1-linux-amd64.tar.gz";
    sha256 = "sha256-4FrvKQdGKfwJM7Oc43kg1Iq4o/OT2/kl89bTKBO4EdQ=";
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
