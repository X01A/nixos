{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "deb60515abe1d70c4b7661d5c9db1ff4305f43f1";
    sha256 = "sha256-sjYjzvihUJP/2SnmyeBqeMr5W8KFVsZKyjeKEEsyVMc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
