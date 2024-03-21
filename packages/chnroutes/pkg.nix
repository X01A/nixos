{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3907d5dbee6233d190fde523b5b8e8892455265e";
    sha256 = "sha256-4kDgr2UfZctrV7o6QRHwirXL6bZmW99JHLUXVMxxlDc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
