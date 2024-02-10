{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ef9132ca38b7a0012a544e30a3c6ff637d62518e";
    sha256 = "sha256-LlCzpHdP8CKMl9o3gBKnW2P7xk/5CU0dvpl8c0dgTbA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
