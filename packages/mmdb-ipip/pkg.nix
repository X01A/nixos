{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-12-14";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "bc4639e9a43919ca8fddbcaaafadef8bcdb3a3e9";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-O3zQJ4Nql332Y5jzjt4fAagHCl0zS2nPgetu2oRrbMA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
