{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "7bc08c4659765065b84bb130709f48008e44c2fa";
    sha256 = "sha256-D46r5nwNCljKTjfCIYxYUuM8ZWzqO+D896AsqYpV0KI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
