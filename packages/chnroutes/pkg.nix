{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2025-12-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "ec0fbef6408b8b62d1155e470e1248d7fa880beb";
    sha256 = "sha256-jS9gz+Xm5irr6mf3wYRDVvDMzRapuON0eCljLVg1EAI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
