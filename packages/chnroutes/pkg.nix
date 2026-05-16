{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "8d987f55856573d0162fd27ff918899422a85818";
    sha256 = "sha256-D16F0dwUgHXgNnotEy0k6tYdUKSq5YvjDbXtIYmEQZo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
