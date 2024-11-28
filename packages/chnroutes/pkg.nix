{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "fd6e2e38ac72f698de7985ec72374f7985f6aa04";
    sha256 = "sha256-7ZXMR8LnbtEyZVvb4OD/zRMhqcBEvs2nuK8jKPvL4nA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
