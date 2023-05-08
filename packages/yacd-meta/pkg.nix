{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-08";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "a345191a050b73fef3f21fdc3f89798b1738476a";
    fetchSubmodules = true;
    sha256 = "sha256-7AwY6hD5A7s00a3Fkqo/lHHoc4QyqH7gStE7oA25xr0=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
