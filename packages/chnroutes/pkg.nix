{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a110ee86c8c61d8427246e0a7113e248e53842ef";
    sha256 = "sha256-DJuchirQvIVt/D7NrKUwBHvHPTKo5LIVYVcMYH8oyp8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
