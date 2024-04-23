{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "42db0dea792586742ccd7ea02f4f7171428add64";
    sha256 = "sha256-VqVrJB4v2xtFLLgqXyp4rQxT0VMzoGvWh2vRef8u0co=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
