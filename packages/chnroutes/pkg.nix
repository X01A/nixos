{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9dd21ae8ee482ba61d23eef226d17f2283e77d07";
    sha256 = "sha256-GQ1gw4TXTvP5Gzlh7gu9sVXl3rtzDR1cN8/vCcWfx8Y=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
