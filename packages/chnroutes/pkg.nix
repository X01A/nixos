{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "261a69e94ea83af10451d063820853ed01c776ef";
    sha256 = "sha256-0RAf72nurE2qXPlUc86sLT3Kn0KcbDglHzbUASxtXvw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
