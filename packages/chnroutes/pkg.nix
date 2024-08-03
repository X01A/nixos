{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9fd539cbe45799f89fa6831f148331c56809ed52";
    sha256 = "sha256-clYYuGFWEuuwdDFo9a31lrxxdljkaFpYSH9hoKVq8I8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
