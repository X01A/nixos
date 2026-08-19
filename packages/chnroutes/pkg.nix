{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "0e2c7ae225a8d11251102985fd4cd406c8e28831";
    sha256 = "sha256-upgoLm8UQpXixKAb/tgWmvKu6wVfix2DTFlxt/rE9OQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
