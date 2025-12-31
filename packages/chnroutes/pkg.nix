{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2025-12-31";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "708ee6a2c2cc66d1d2b1281cbca0a3d9211f0d6b";
    sha256 = "sha256-Xz3SX/yXh0FZw8uCIUdjsvN2vkNWMSGHeelx9t/uT3Q=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
