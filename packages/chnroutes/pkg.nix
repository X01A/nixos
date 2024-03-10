{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "848d6f80d8eb6fe88bf5e7fadb2890da52928f5c";
    sha256 = "sha256-XR+t8k17FZdAoO0f3O4qVvuFh1o8qf68Chi9ZCFKGVY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
