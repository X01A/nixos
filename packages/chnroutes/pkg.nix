{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7a5044eee5e98128d9a789ef8067b8ca9a77ca08";
    sha256 = "sha256-GtJ6vO10GvmV6Po/9Jgt+B12Q4hPxBCQbBdLJiMeBDM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
