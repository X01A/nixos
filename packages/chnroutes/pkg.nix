{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "67dd24c0a19e20a17b82f8a45822fd8137b2c89a";
    sha256 = "sha256-mSNcJwWWQJfIFgsaCHp5yT5KMYEDEmZetYY8K0nH41E=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
