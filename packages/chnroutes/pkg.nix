{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b28d854173e6d0339cb2139e5dfbb2ab6e99c088";
    sha256 = "sha256-HFWM59hMvmuWK84dcID++hW4yetzAGM7lMdAiTc8KvQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
