{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8ed4011aad74793f43f5e89385c6e0dc9915b8ca";
    sha256 = "sha256-4B3pwrFN3IKc8ge+x9gEw1cGXCPwzFmc1YIUV6cMXIw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
