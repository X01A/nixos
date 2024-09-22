{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "828d302b704cd5979e22331b66d30083a0af3063";
    sha256 = "sha256-aC1/BxMCaBCCZxQ7fWN+p0jhl8llg+Fx61qEbBdQfmo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
