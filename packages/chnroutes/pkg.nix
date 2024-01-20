{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "14b06e83eba0094e569aaea377182e1d8fa70c5b";
    sha256 = "sha256-zzTlUscgkadNUwnkIZLxpEdquPkroSKasVV2kKEoiNs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
