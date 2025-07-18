{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202507140313-unstable-2025-07-17";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4756d7719a0257d6cb1fa6cd4d328c793d67dce0";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-a0AqpNvOgwSocySttijs78pfnpmumpM1UQ+U6hufDqo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
