{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "5a2088d0442e74666206f534192668d479cb48a7";
    sha256 = "sha256-iVHvUREJKIxG31UGTQAnL+//Eqwu9L9WLDW5K9KK49U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
