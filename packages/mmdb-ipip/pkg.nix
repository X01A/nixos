{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202501130310-unstable-2025-01-16";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e8fe2140a5c12b60deb36bcd1b80af67b9c76b30";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-1fjVL+uKdzRoFy0cjBvTm0rd9Cqp1enbDuOy+4QhHTc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
