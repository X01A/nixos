{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "7b1a9818e1de5a966f92200b1346b8c7fffc2d61";
    sha256 = "sha256-Bcy2CJmfoaeqATjvoQh508qtnWRm7HD3099aW0PsVb8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
