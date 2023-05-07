{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-05-07";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "489c209012aa7505076e110c55f37911b11b0aaa";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-DdAJxCdHrmixmXOr0g3LZjrxUXTzbBHrClkQUz7hBjc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
