{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "4e0ae4be9225c540f69d96dea0694cc4efbade45";
    sha256 = "sha256-SpJkys+wx/A+HwdOvFiJYKSlyTDVWxwADcCNsTBIAp4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
