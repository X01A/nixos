{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202502100311-unstable-2025-02-11";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "fce7d9465e50eb0f7a2e415c14fc496c0c8a52cb";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-LFG3puZsiGRNbNm7oFgMMt4kUxs+MWlRWf0N5lUYGvo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
