{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c4da174ea60e8c123a19310b7e8eb1983b435e96";
    sha256 = "sha256-TJZKg3YYxHKD0YoKaY6hTlW1YoSTfhHEZJO6C5fFueU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
