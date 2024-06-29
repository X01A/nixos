{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d153ba878e463a27744b4065065951bdd789f467";
    sha256 = "sha256-P8NINvGvnCq/juUk23ZSuJ8w6sms79XCwLGutueEEyI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
