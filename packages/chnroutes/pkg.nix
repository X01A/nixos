{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f6dea73da8cdbb8e2bbe8f93ad81d488e7e52754";
    sha256 = "sha256-8w07Gl58vCpO6MMSV5jdPzPTIUVpbAmVPej0yVZQifc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
