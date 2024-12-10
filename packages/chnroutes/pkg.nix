{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "cef266630e0d1580f8cdbdf48ec33b19f16103e3";
    sha256 = "sha256-pLnKhcuaJQGkVQ/cO9YGgBL/5aZh39FqX6Vd+B9Yafs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
