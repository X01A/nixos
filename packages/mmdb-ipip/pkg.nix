{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-10-26";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "07faeba9f2108a7c7a3b2d8250a391bfec434c4a";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-D3UdWv3/lVlV5wQfC+D/gKsRQzPB9pUH9ZPAZBdJPOA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
