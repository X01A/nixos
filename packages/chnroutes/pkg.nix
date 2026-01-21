{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "7f64ba0fdb2e1b0de8b29ffa6e4a85238cc17076";
    sha256 = "sha256-iZl6u/EhpEZSMMtwjEgMlBWwuUxbT6FQR5o05L6nGv8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
