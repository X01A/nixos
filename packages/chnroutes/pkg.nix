{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "09dd8eae80b223ce2bc5cfb3900a538ac131dd20";
    sha256 = "sha256-N54KvmQe2TB55PV7ljqZO2nvIhY13jDTWi6k0X63XRY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
