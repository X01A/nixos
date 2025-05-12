{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "eec263089a4a2b1abcde75a36423bdd38aa9c588";
    sha256 = "sha256-jzkET/0K9KGGUVLUcj6K45UHNo/5HlSxF/Ppqx7zndQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
