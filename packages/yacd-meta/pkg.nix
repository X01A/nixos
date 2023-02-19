{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-02-19";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "6459b1533509250a038f5cb8f707c8362ec5b7bc";
    fetchSubmodules = true;
    sha256 = "sha256-r/4Ahi9zW4ORQawGfKhq98crPK+zWrUFKVSmaR5np9Q=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
