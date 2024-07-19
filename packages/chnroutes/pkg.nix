{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "cc19a824ba3ed0ede06a9cbea973a7a1928cb1dd";
    sha256 = "sha256-OxI+tksAYG77vMJlmLP9asC+tMLMGgSg1N9koHLVmXw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
